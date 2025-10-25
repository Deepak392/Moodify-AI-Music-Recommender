#!/bin/bash

echo "🎭 Moodify Installation Script"
echo "=============================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v14 or higher."
    echo "Visit: https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 14 ]; then
    echo "❌ Node.js version 14 or higher is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm."
    exit 1
fi

echo "✅ npm version: $(npm -v)"

# Navigate to server directory
cd server

# Install dependencies
echo "📦 Installing server dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✅ Dependencies installed successfully"

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp ../env.example .env
    echo "⚠️  Please edit .env file with your API credentials:"
    echo "   - HF_TOKEN: Your Hugging Face API token"
    echo "   - SPOTIFY_CLIENT_ID: Your Spotify Client ID"
    echo "   - SPOTIFY_CLIENT_SECRET: Your Spotify Client Secret"
    echo ""
    echo "📖 See README.md for detailed setup instructions"
else
    echo "✅ .env file already exists"
fi

# Go back to root directory
cd ..

echo ""
echo "🎉 Installation completed!"
echo ""
echo "🚀 To start the application:"
echo "   1. Edit server/.env with your API credentials"
echo "   2. Run: cd server && npm start"
echo "   3. Open: http://localhost:3000"
echo ""
echo "📚 For more information, see README.md" 