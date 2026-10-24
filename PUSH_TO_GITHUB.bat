@echo off
title FruitKart - Push to GitHub
color 0B
echo ====================================================================
echo             FRUITKART - PUSH TO GITHUB REPOSITORY
echo ====================================================================
echo.
echo Target Repository: https://github.com/vivankumarguptabca25-bit/Fruitkart
echo.

set "PATH=%LOCALAPPDATA%\Programs\Git\cmd;%PATH%"

echo [1] Standard push koshish kar rahe hain...
git push -u origin main
if not errorlevel 1 goto success

echo.
echo ====================================================================
echo Browser login nahi chala ya authentication error aaya.
echo Agar aapke paas GitHub Personal Access Token (PAT) hai:
echo ====================================================================
echo.
set /p "GHTOKEN=GitHub Personal Access Token yahan paste karein (ya Enter dabayein skip karne ke liye): "

if "%GHTOKEN%"=="" goto failed

echo.
echo Token ke sath push kar rahe hain...
git push https://%GHTOKEN%@github.com/vivankumarguptabca25-bit/Fruitkart.git main -u
if errorlevel 1 goto failed

:success
echo.
echo ====================================================================
echo [SUCCESS] Website code successfully pushed to GitHub!
echo Repository link: https://github.com/vivankumarguptabca25-bit/Fruitkart
echo ====================================================================
goto finish

:failed
echo.
echo ====================================================================
echo [INFO] Agar aapko token banana ho:
echo 1. https://github.com/settings/tokens par jayein
echo 2. "Generate new token (classic)" par click karein
echo 3. "repo" permission check karein aur generate karein
echo 4. Token copy karke is script ko dobara run karein ya chat me bhejein!
echo ====================================================================

:finish
echo.
pause
