rem bat�t�@�C���o�R��Aseprite�����s����B 
rem (Steam�̃��C�Z���X�F�؂�Aseprite�̏I����҂��Ă��܂����߁A �񓯊���Aseprite���N�����A
rem ���̌��ʃT�C�Y�ύX�p��powershell�����s����)
start "" cmd /s /c ".\aseprite.bat"
timeout /t 1 /nobreak >nul
powershell ".\�z���C�g�{�[�h�N��.ps1" -Width 1260 -Height 760
rem ����ʃT�C�Y��ύX����Ƃ��́��̐�����ς��邱�ƁB

rem Aseprite���s��� ��ʃT�C�Y�����킹�邱��
rem �L�[�{�[�h�V���[�g�J�b�g�F�R�}���h > ��ʂɍ��킹��@���L�[���蓖�Ă��Ă����ƕ֗�
rem ���̂��Ƃ�Ctrl+F�ŃA�h�o���X���[�h�ɂ���
rem (2�񉟉�����ƃt���X�N���[���ɂȂ�)