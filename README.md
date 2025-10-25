# 🎭 Moodify - AI-Powered Emotion Detection & Music Recommendations

A modern web application that uses AI to detect emotions from facial expressions and provides personalized music recommendations based on the detected mood.

## ✨ Features

- **AI Emotion Detection**: Uses Hugging Face's ViT model trained on FER-2013 dataset
- **Multiple Input Methods**: Upload images or use live webcam capture
- **Music Recommendations**: Spotify integration with mood-based song suggestions
- **Real-time Analysis**: Instant emotion detection with confidence scores
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Accessibility**: Full keyboard navigation and screen reader support
- **Security**: Secure backend API with protected credentials

## 🚀 Quick Start

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Spotify Developer Account
- Hugging Face API Token

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd moodify-app
   ```

2. **Install server dependencies**
   ```bash
   cd server
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp env.example .env
   ```
   
   Edit `.env` with your API credentials:
   ```env
   HF_TOKEN=your_huggingface_token_here
   SPOTIFY_CLIENT_ID=your_spotify_client_id_here
   SPOTIFY_CLIENT_SECRET=your_spotify_client_secret_here
   PORT=3000
   NODE_ENV=development
   ```

4. **Start the server**
   ```bash
   npm start
   # or for development with auto-reload
   npm run dev
   ```

5. **Open the application**
   - Navigate to `http://localhost:3000`
   - The frontend will be served automatically by the backend

## 🔧 Configuration

### API Keys Setup

#### Hugging Face
1. Go to [Hugging Face](https://huggingface.co/)
2. Create an account and get your API token
3. Add it to your `.env` file as `HF_TOKEN`

#### Spotify
1. Go to [Spotify Developer Dashboard](https://developer.spotify.com/dashboard)
2. Create a new application
3. Get your Client ID and Client Secret
4. Add them to your `.env` file

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `HF_TOKEN` | Hugging Face API token | Yes |
| `SPOTIFY_CLIENT_ID` | Spotify Client ID | Yes |
| `SPOTIFY_CLIENT_SECRET` | Spotify Client Secret | Yes |
| `PORT` | Server port (default: 3000) | No |
| `NODE_ENV` | Environment (development/production) | No |

## 📱 Usage

### Upload Image
1. Click "📁 Upload Image" or drag and drop an image
2. Supported formats: JPG, PNG
3. Maximum file size: 5MB
4. Wait for AI analysis
5. View emotion results and music recommendations

### Webcam Capture
1. Click "📷 Use Webcam"
2. Grant camera permissions
3. Click "📸 Capture & Analyze"
4. View results instantly

### Music Recommendations
- Based on detected emotion
- Spotify integration when available
- Fallback recommendations when offline
- Preview songs directly in the app

## 🏗️ Architecture

### Frontend
- **HTML5**: Semantic markup with accessibility features
- **CSS3**: Modern styling with CSS variables and responsive design
- **JavaScript**: ES6+ with modular functions and error handling
- **Chart.js**: Interactive emotion probability charts

### Backend
- **Node.js**: Server runtime
- **Express.js**: Web framework
- **Multer**: File upload handling
- **Hugging Face**: AI model inference
- **Spotify API**: Music recommendations

### Security Features
- ✅ Credentials stored securely on backend
- ✅ Input validation and sanitization
- ✅ File size and type restrictions
- ✅ CORS protection
- ✅ Error handling without exposing sensitive data

## 🎨 Design Features

### Accessibility
- ARIA labels and roles
- Keyboard navigation support
- Screen reader compatibility
- High contrast mode support
- Reduced motion preferences

### Responsive Design
- Mobile-first approach
- Touch-friendly interface
- Adaptive layouts
- Optimized for all screen sizes

### User Experience
- Loading states and progress indicators
- Clear error messages
- Intuitive navigation
- Smooth animations
- Offline fallback support

## 🔍 API Endpoints

### `POST /api/predict`
Analyzes an uploaded image for emotion detection.

**Request:**
- Content-Type: `multipart/form-data`
- Body: Image file

**Response:**
```json
{
  "predictedClass": 3,
  "probabilities": [0.1, 0.05, 0.02, 0.8, 0.01, 0.01, 0.01]
}
```

### `GET /api/spotify/search?emotion=Happy`
Searches Spotify for music recommendations based on emotion.

**Response:**
```json
{
  "tracks": [
    {
      "id": "track_id",
      "name": "Song Name",
      "artists": [{"name": "Artist Name"}],
      "album": {"name": "Album Name", "images": [...]},
      "preview_url": "https://...",
      "external_urls": {"spotify": "https://..."}
    }
  ]
}
```

### `GET /api/health`
Health check endpoint.

**Response:**
```json
{
  "status": "OK",
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

## 🛠️ Development

### Project Structure
```
moodify-app/
├── css/
│   └── styles.css          # Enhanced CSS with variables
├── js/
│   └── script.js           # Frontend JavaScript
├── server/
│   ├── server.js           # Express backend
│   └── package.json        # Server dependencies
├── index.html              # Main HTML file
├── env.example             # Environment variables template
└── README.md              # This file
```

### Development Commands
```bash
# Start development server with auto-reload
npm run dev

# Start production server
npm start

# Run tests (when implemented)
npm test
```

## 🧪 Testing

### Manual Testing Checklist
- [ ] Image upload functionality
- [ ] Webcam capture
- [ ] Emotion detection accuracy
- [ ] Music recommendations
- [ ] Mobile responsiveness
- [ ] Accessibility features
- [ ] Error handling
- [ ] Loading states

### Browser Compatibility
- ✅ Chrome (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Edge (latest)
- ✅ Mobile browsers

## 🚀 Deployment

### Production Setup
1. Set `NODE_ENV=production` in environment
2. Use HTTPS in production
3. Set up proper CORS configuration
4. Configure rate limiting
5. Set up monitoring and logging

### Deployment Options
- **Heroku**: Easy deployment with Git integration
- **Vercel**: Serverless deployment
- **AWS**: EC2 or Lambda deployment
- **Docker**: Containerized deployment

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- **Hugging Face**: For providing the emotion detection model
- **Spotify**: For music recommendation API
- **Chart.js**: For interactive charts
- **FER-2013 Dataset**: For training the emotion detection model

## 📞 Support

For support or questions:
- Create an issue on GitHub
- Check the troubleshooting section below

## 🔧 Troubleshooting

### Common Issues

**Server won't start:**
- Check if port 3000 is available
- Verify all environment variables are set
- Ensure Node.js version is 14+

**Image upload fails:**
- Check file size (max 5MB)
- Verify file format (JPG/PNG only)
- Ensure server is running

**Spotify recommendations not working:**
- Verify Spotify credentials in `.env`
- Check if Spotify API is accessible
- Fallback recommendations will be used

**Webcam not working:**
- Grant camera permissions in browser
- Check if camera is available
- Try refreshing the page

---

**Made with ❤️ for emotion-aware music discovery**
