@echo off
rem autogenerated by uru

set URU_INVOKER=batch

"%~dp0uru_rt.exe" %*

if "x%URU_HOME%x"=="xx" (
  if exist "%USERPROFILE%\.uru\uru_lackee.bat" (call "%USERPROFILE%\.uru\uru_lackee.bat")
) else (
  if exist "%URU_HOME%\uru_lackee.bat" (call "%URU_HOME%\uru_lackee.bat")
)
