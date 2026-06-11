# SignMeUp

Event registration and management platform available on web and mobile.

## Projects

This repository contains two applications:

### 🌐 Web Application (`/web`)

A modern web application built with React, TypeScript, and Firebase.

**Features:**
- User authentication with Firebase Auth
- Event browsing and registration
- Real-time updates with Firestore
- Responsive design for all devices
- Ready for deployment (Netlify, Vercel, Firebase Hosting)

**Tech Stack:**
- React 18 + TypeScript
- Vite (build tool)
- Firebase (Auth + Firestore)
- React Router 6

**Quick Start:**
```bash
cd web
npm install
cp .env.example .env.local
# Add your Firebase credentials to .env.local
npm run dev
```

See [web/README.md](web/README.md) for detailed documentation.

---

### 📱 Mobile Application (React Native)

A React Native mobile application for iOS and Android.

**Features:**
- Cross-platform mobile app (iOS & Android)
- Built with React Native

**Tech Stack:**
- React Native 0.76.3
- TypeScript
- React 18

**Quick Start:**

> **Note**: Make sure you have completed the [React Native - Environment Setup](https://reactnative.dev/docs/environment-setup) instructions.

```bash
# Install dependencies
npm install

# Start Metro bundler
npm start

# Run on Android
npm run android

# Run on iOS
npm run ios
```

## Development

### Prerequisites

- Node.js 18 or higher
- npm or yarn
- For mobile: React Native development environment
- For web: Firebase account

### Repository Structure

```
SignMeUp/
├── web/                  # Web application
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── config/
│   ├── package.json
│   └── README.md
├── android/              # React Native Android
├── ios/                  # React Native iOS
├── App.tsx              # React Native entry point
├── package.json         # React Native dependencies
└── README.md           # This file
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the MIT License.

## Support

For questions or issues, please open an issue in the GitHub repository.
