@echo off
echo 🎭 Moodify Installation Script
echo ==============================

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js v14 or higher.
    echo Visit: https://nodejs.org/
    pause
    exit /b 1
)

REM Check Node.js version
for /f "tokens=1,2 delims=." %%a in ('node --version') do set NODE_VERSION=%%a
set NODE_VERSION=%NODE_VERSION:~1%
if %NODE_VERSION% lss 14 (
    echo ❌ Node.js version 14 or higher is required. Current version: 
    node --version
    pause
    exit /b 1
)

echo ✅ Node.js version: 
node --version

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm.
    pause
    exit /b 1
)

echo ✅ npm version: 
npm --version

REM Navigate to server directory
cd server

REM Install dependencies
echo 📦 Installing server dependencies...
npm install

if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo ✅ Dependencies installed successfully

REM Check if .env file exists
if not exist .env (
    echo 📝 Creating .env file from template...
    copy ..\env.example .env
    echo ⚠️  Please edit .env file with your API credentials:
    echo    - HF_TOKEN: Your Hugging Face API token
    echo    - SPOTIFY_CLIENT_ID: Your Spotify Client ID
    echo    - SPOTIFY_CLIENT_SECRET: Your Spotify Client Secret
    echo.
    echo 📖 See README.md for detailed setup instructions
) else (
    echo ✅ .env file already exists
)

REM Go back to root directory
cd ..

echo.
echo 🎉 Installation completed!
echo.
echo 🚀 To start the application:
echo    1. Edit server\.env with your API credentials
echo    2. Run: cd server ^&^& npm start
echo    3. Open: http://localhost:3000
echo.
echo 📚 For more information, see README.md
pause 