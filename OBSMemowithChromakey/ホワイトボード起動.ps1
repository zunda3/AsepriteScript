#====================================================================
# 引数を処理(デフォルト値)
#====================================================================
Param(
    [String]$ProcessName="*",   # プロセス名
    [String]$WindowTitle="WhiteBoard.aseprite*",  # ウインドウタイトル(正規表現)
    [Int32]$Width="1260",        # ウインドウ幅
    [Int32]$Height="760"        # ウインドウ高さ
)

#====================================================================
# ウインドウサイズを変更する関数 Resize-Window
#====================================================================
Add-Type @"
using System;
using System.Runtime.InteropServices;

public struct RECT
{
    public int Left;
    public int Top;
    public int Right;
    public int Bottom;
}

public class WinAPI
{
    // ウインドウの現在の座標データを取得する関数
    [DllImport("user32.dll")]
    public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);

    // ウインドウの座標を変更する関数
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
}
"@

function Resize-Window {
    param (
        $wh  # ウインドウハンドラ
    )

    # ウインドウ座標データ構造体
    $rc = New-Object RECT

    # ウインドウの現在の座標データを取得
    [WinAPI]::GetWindowRect($wh, [ref]$rc) > $null

    # 左上の場所はそのままに、ウインドウのサイズを変更
    [WinAPI]::MoveWindow($wh, $rc.Left, $rc.Top, $width, $height, $true) > $null
}

#====================================================================
# 対象となるウインドウを選択し、サイズを変更
#====================================================================
Get-Process -Name $processName |
    ? { $_.MainWindowHandle -ne 0 } |
    ? { $_.MainWindowTitle -match "$windowTitle" } |
    % {
        # ウインドウサイズを変更
        Resize-Window($_.MainWindowHandle);
}