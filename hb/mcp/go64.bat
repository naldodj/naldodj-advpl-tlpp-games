@setlocal
del .\msvc64\hb_totvs_mcp.exe
SET HB_BASE_PATH="F:\harbour_msvc\bin\win\msvc64\hbmk2"
call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
%HB_BASE_PATH% hb_totvs_mcp.hbp -comp=msvc64
@endlocal
