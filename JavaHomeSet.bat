@echo off
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set javahome=%~dp0jdk1.8.0_91
echo === ׼�����û�������: JAVA_HOME=%javahome%
echo === ׼�����û�������(�����и�.): classPath=%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\lib\dt.jar;.
echo === ׼�����û�������: PATH=%%JAVA_HOME%%\bin
set /P EN=��ȷ�Ϻ� �س��� ��ʼ����!
echo.
echo.
echo === �´����������� JAVA_HOME=%javahome%
setx "JAVA_HOME" "%javahome%"
echo === �´����������� classPath=%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%%\lib\dt.jar;.
setx "classPath" "%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%%\lib\dt.jar;."
echo === ��׷�ӻ�������(׷�ӵ���ǰ��) PATH=%%JAVA_HOME%%\bin
for /f "tokens=1,* delims=:" %%a in ('reg QUERY "%regpath%" /v "path"') do (
    set "L=%%a"
    set "P=%%b"
)
set "Y=%L:~-1%:%P%"
setx path "%%JAVA_HOME%%\bin;%Y%"
echo.
echo.
echo === �밴������˳�! 
pause>nul