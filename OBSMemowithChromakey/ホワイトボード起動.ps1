#====================================================================
# ����������(�f�t�H���g�l)
#====================================================================
Param(
    [String]$ProcessName="*",   # �v���Z�X��
    [String]$WindowTitle="WhiteBoard.aseprite*",  # �E�C���h�E�^�C�g��(���K�\��)
    [Int32]$Width="1260",        # �E�C���h�E��
    [Int32]$Height="760"        # �E�C���h�E����
)

#====================================================================
# �E�C���h�E�T�C�Y��ύX����֐� Resize-Window
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
    // �E�C���h�E�̌��݂̍��W�f�[�^���擾����֐�
    [DllImport("user32.dll")]
    public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);

    // �E�C���h�E�̍��W��ύX����֐�
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
}
"@

function Resize-Window {
    param (
        $wh  # �E�C���h�E�n���h��
    )

    # �E�C���h�E���W�f�[�^�\����
    $rc = New-Object RECT

    # �E�C���h�E�̌��݂̍��W�f�[�^���擾
    [WinAPI]::GetWindowRect($wh, [ref]$rc) > $null

    # ����̏ꏊ�͂��̂܂܂ɁA�E�C���h�E�̃T�C�Y��ύX
    [WinAPI]::MoveWindow($wh, $rc.Left, $rc.Top, $width, $height, $true) > $null
}

#====================================================================
# �ΏۂƂȂ�E�C���h�E��I�����A�T�C�Y��ύX
#====================================================================
Get-Process -Name $processName |
    ? { $_.MainWindowHandle -ne 0 } |
    ? { $_.MainWindowTitle -match "$windowTitle" } |
    % {
        # �E�C���h�E�T�C�Y��ύX
        Resize-Window($_.MainWindowHandle);
}