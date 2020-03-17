@if exist build ( rmdir /q /s build )
@mkdir build
@cd build

@rem ������Ⱦģʽ
@set NANOVG_TYPE=AGGE
@rem set NANOVG_TYPE=GLES2
@rem set NANOVG_TYPE=GLES3
@rem set NANOVG_TYPE=AGG

@rem �������ùȸ�ƴ��
@rem PINYIN_ENABLE=ON

@rem ���ò��־���
@set DISABLE_WARNING=ON

@rem ����VS������
@set VS_GENERATOR="Visual Studio 15 Win64"

D:\program\cmake\bin\cmake -DNANOVG_BACKEND=%NANOVG_TYPE% -DGPINYIN_ENABLE=%PINYIN_ENABLE% -DDISABLE_WARNING=%DISABLE_WARNING% -G %VS_GENERATOR% ../cmake
pause