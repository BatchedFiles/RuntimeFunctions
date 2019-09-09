set IncludeFilesPath=-i Classes -i Interfaces -i Modules
set IncludeLibraries=-l crypt32 -l Mswsock
set MaxErrorsCount=-maxerr 1
set OptimizationLevel=-O 0
set MinWarningLevel=-w all
set AddDebugInfo=-g
REM set EnableFunctionProfiling=-profile
REM set WriteOutOnlyAsm=-r
REM set CreateStaticLibrary=-lib
REM set ShowIncludes=-showincludes
set SERVICE_DEFINED=
set MainFile=test\ValueBSTR\main.bas
set Win32Subsystem=-s console
set OutputFileName=-x bin\x64\ValueBSTR.exe
set WITHOUT_RUNTIME_DEFINED=
set UseThreadSafeRuntime=-mt
set WriteOutOnlyAsm=
set CreateStaticLibrary=
REM set UNICODE_DEFINED=-d unicode

"%ProgramFiles%\FreeBASIC\fbc.exe" %MaxErrorsCount% %UseThreadSafeRuntime% %OutputFileName% %IncludeLibraries% %IncludeFilesPath% %UNICODE_DEFINED% %SERVICE_DEFINED% %WITHOUT_RUNTIME_DEFINED% %OptimizationLevel% %Win32Subsystem% %MinWarningLevel% %AddDebugInfo% %EnableFunctionProfiling% %WriteOutOnlyAsm% %CreateStaticLibrary% %ShowIncludes% %MainFile%  Classes\ValueBSTR.bas >_out.txt