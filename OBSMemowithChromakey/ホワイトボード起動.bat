rem batファイル経由でAsepriteを実行する。 
rem (Steamのライセンス認証がAsepriteの終了を待ってしまうため、 非同期でAsepriteを起動し、
rem その後画面サイズ変更用のpowershellを実行する)
start "" cmd /s /c ".\aseprite.bat"
timeout /t 1 /nobreak >nul
powershell ".\ホワイトボード起動.ps1" -Width 1260 -Height 760
rem ■画面サイズを変更するときは↑の数字を変えること。

rem Aseprite実行後は 画面サイズを合わせること
rem キーボードショートカット：コマンド > 画面に合わせる　をキー割り当てしておくと便利
rem そのあとにCtrl+Fでアドバンスモードにする
rem (2回押下するとフルスクリーンになる)