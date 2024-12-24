@echo off
setlocal

:: 1. ダウンロード先のURLと保存するファイル名を指定
set DOWNLOAD_URL=https://www.python.org/ftp/python/3.12.6/python-3.12.6-embed-amd64.zip
set ZIP_FILE=python-3.12.6-embed-amd64.zip

:: 2. ダウンロードを実行 (curlを使用)
echo Downloading %DOWNLOAD_URL%...
curl -o %ZIP_FILE% %DOWNLOAD_URL%
if %errorlevel% neq 0 (
    echo Error: Failed to download the file.
    exit /b 1
)

:: 3. ZIPファイルを解凍 (PowerShellを使用)
echo Extracting %ZIP_FILE%...
powershell Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '.'"
if %errorlevel% neq 0 (
    echo Error: Failed to extract the ZIP file.
    exit /b 1
)

:: 完了メッセージ
echo Done!
pause
