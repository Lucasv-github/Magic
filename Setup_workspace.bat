@echo off
setlocal enableDelayedExpansion

set "MINECRAFT_TRY_1=%APPDATA%\.minecraft\"

if exist %MINECRAFT_TRY_1% (
    set MINECRAFT_FOLDER=%MINECRAFT_TRY_1%
) else (
	set /p MINECRAFT_FOLDER="Enter minecraft folder location: "
)

echo Minecraft folder exists at: %MINECRAFT_FOLDER%
echo(

:minecraft_folde_exists
IF EXIST "%MINECRAFT_FOLDER%\Magic_workspace_location.txt" (
  set /p FIRST_LINE=<"%MINECRAFT_FOLDER%\Magic_workspace_location.txt"
  
  IF EXIST "!FIRST_LINE!" (
      echo A workspace already exists at: !FIRST_LINE!, Using that.
	  set WORKSPACE_FOLDER=!FIRST_LINE!
	  goto workspace_exists
  )
)

:get_worspace_folder
set /p WORKSPACE_WORLD="Enter workspace world: "

IF EXIST "%MINECRAFT_FOLDER%\saves\%WORKSPACE_WORLD%" (
  set WORKSPACE_FOLDER=%MINECRAFT_FOLDER%\saves\%WORKSPACE_WORLD%
  @echo|set /p="%MINECRAFT_FOLDER%\saves\%WORKSPACE_WORLD%"> %MINECRAFT_FOLDER%\Magic_workspace_location.txt
  goto workspace_exists
) ELSE (
  echo %MINECRAFT_FOLDER%\saves\%WORKSPACE_WORLD% Does not exist.
  goto get_worspace_folder
)

:workspace_exists
echo(
echo %WORKSPACE_FOLDER% Set as workspace.
echo(

:question
set /P choice=[Change] [Update] [close]
IF "%choice%"=="change" goto change
IF "%choice%"=="update" goto update
IF "%choice%"=="close" goto close

goto question

:change
del "%MINECRAFT_FOLDER%\Magic_workspace_location.txt"
goto minecraft_folde_exists

:update
set WORKSPACE_RESOURCEPACK_FOLDER=%MINECRAFT_FOLDER%\resourcepacks
set WORKSPACE_DATAPACK_FOLDER=%WORKSPACE_FOLDER%\datapacks
echo(
echo %WORKSPACE_RESOURCEPACK_FOLDER%
echo %WORKSPACE_DATAPACK_FOLDER%

echo(

if exist "%WORKSPACE_DATAPACK_FOLDER%\Magic\" echo Removing Magic: %WORKSPACE_DATAPACK_FOLDER%\Magic\
if exist "%WORKSPACE_DATAPACK_FOLDER%\Magic\" rd /q /s "%WORKSPACE_DATAPACK_FOLDER%\Magic\"

if exist "%WORKSPACE_DATAPACK_FOLDER%\Magic_commons\" echo Removing Magic_commons: %WORKSPACE_DATAPACK_FOLDER%\Magic_commons\
if exist "%WORKSPACE_DATAPACK_FOLDER%\Magic_commons\" rd /q /s "%WORKSPACE_DATAPACK_FOLDER%\Magic_commons\"

if exist "%WORKSPACE_DATAPACK_FOLDER%\Magic_help\" echo Removing Magic_help: %WORKSPACE_DATAPACK_FOLDER%\Magic_help\
if exist "%WORKSPACE_DATAPACK_FOLDER%\Magic_help\" rd /q /s "%WORKSPACE_DATAPACK_FOLDER%\Magic_help\"


if exist "%WORKSPACE_RESOURCEPACK_FOLDER%\Magic_resourcepack\" echo Removing magic resource pack: %WORKSPACE_RESOURCEPACK_FOLDER%\Magic_resourcepack\
if exist "%WORKSPACE_RESOURCEPACK_FOLDER%\Magic_resourcepack\" rd /q /s "%WORKSPACE_RESOURCEPACK_FOLDER%\Magic_resourcepack\"

echo(

echo Download started to: %TEMP%\Magic_entire.zip
powershell -command "Invoke-WebRequest -Uri "https://github.com/Lucasv-github/Magic/archive/refs/heads/main.zip" -OutFile "%TEMP%\Magic_entire.zip""

SET EXTRACT_LOCATION=%TEMP%\Magic-main\

echo Extract started to: %EXTRACT_LOCATION%
powershell -command "Expand-Archive -Force %TEMP%\Magic_entire.zip %TEMP%"

xcopy /s "%EXTRACT_LOCATION%\Magic\" "%WORKSPACE_DATAPACK_FOLDER%\Magic\"
xcopy /s "%EXTRACT_LOCATION%\Magic_commons\" "%WORKSPACE_DATAPACK_FOLDER%\Magic_commons\"
xcopy /s "%EXTRACT_LOCATION%\Magic_help\" "%WORKSPACE_DATAPACK_FOLDER%\Magic_help\"

xcopy /s "%EXTRACT_LOCATION%\Magic_resourcepack\" "%WORKSPACE_RESOURCEPACK_FOLDER%\Magic_resourcepack\"

echo(
echo Done
goto question

:close
exit