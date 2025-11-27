# SignMeUp Web Application

A modern, full-featured event registration web application built with React, TypeScript, Firebase, and Vite.

## Features

- 🔐 **User Authentication** - Sign up, login, and logout with Firebase Auth
- 📅 **Event Management** - Browse and register for upcoming events
- 🎨 **Modern UI** - Clean, responsive design that works on all devices
- ⚡ **Fast Performance** - Built with Vite for lightning-fast development and builds
- 🔥 **Firebase Integration** - Authentication and Firestore database
- 🛣️ **Client-side Routing** - Seamless navigation with React Router
- 📱 **Responsive Design** - Mobile-first approach for all screen sizes

## Tech Stack

- **React 18** - Modern React with hooks
- **TypeScript** - Type-safe code
- **Vite** - Next-generation frontend tooling
- **Firebase** - Authentication and Firestore database
- **React Router 6** - Client-side routing
- **CSS3** - Custom styling with CSS variables

## Project Structure

```
web/
├── public/              # Static assets
├── src/
│   ├── components/      # Reusable React components
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   └── EventCard.tsx
│   ├── pages/          # Page components
│   │   ├── Landing.tsx
│   │   ├── Login.tsx
│   │   ├── Signup.tsx
│   │   └── Events.tsx
│   ├── services/       # Business logic and contexts
│   │   └── AuthContext.tsx
│   ├── config/         # Configuration files
│   │   └── firebase.ts
│   ├── types/          # TypeScript type definitions
│   │   └── index.ts
│   ├── styles/         # Global styles
│   │   └── index.css
│   ├── App.tsx         # Main app component
│   └── main.tsx        # App entry point
├── package.json
├── vite.config.ts
└── tsconfig.json
```

## Getting Started

### Prerequisites

- Node.js 18 or higher
- npm or yarn
- Firebase account

### Installation

1. **Navigate to the web directory:**
   ```bash
   cd web
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Set up Firebase:**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or use an existing one
   - Enable Authentication (Email/Password)
   - Create a Firestore database
   - Get your Firebase config from Project Settings

4. **Configure environment variables:**
   ```bash
   cp .env.example .env.local
   ```

   Then edit `.env.local` and add your Firebase credentials:
   ```env
   VITE_FIREBASE_API_KEY=your_api_key
   VITE_FIREBASE_AUTH_DOMAIN=your_project_id.firebaseapp.com
   VITE_FIREBASE_PROJECT_ID=your_project_id
   VITE_FIREBASE_STORAGE_BUCKET=your_project_id.appspot.com
   VITE_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
   VITE_FIREBASE_APP_ID=your_app_id
   VITE_FIREBASE_MEASUREMENT_ID=your_measurement_id
   ```

5. **Start the development server:**
   ```bash
   npm run dev
   ```

6. **Open your browser:**
   Navigate to `http://localhost:3000`

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint

## Firebase Setup

### Firestore Database Structure

Create the following collections in Firestore:

#### Events Collection (`events`)
```javascript
{
  title: string,
  description: string,
  date: timestamp,
  location: string,
  capacity: number,
  registered: number,
  createdBy: string,
  createdAt: timestamp
}
```

#### Registrations Collection (`registrations`)
```javascript
{
  eventId: string,
  userId: string,
  userName: string,
  userEmail: string,
  registeredAt: timestamp,
  status: 'confirmed' | 'waitlist' | 'cancelled'
}
```

### Firestore Security Rules

Add these security rules in Firebase Console:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow authenticated users to read events
    match /events/{eventId} {
      allow read: if request.auth != null;
      allow create, update: if request.auth != null;
      allow delete: if request.auth != null &&
                       resource.data.createdBy == request.auth.uid;
    }

    // Allow users to manage their own registrations
    match /registrations/{registrationId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null;
      allow update, delete: if request.auth != null &&
                               resource.data.userId == request.auth.uid;
    }
  }
}
```

## Deployment

### Deploy to Netlify

1. Push your code to GitHub
2. Go to [Netlify](https://netlify.com)
3. Click "New site from Git"
4. Select your repository
5. Build settings are already configured in `netlify.toml`
6. Add environment variables in Netlify dashboard
7. Deploy!

### Deploy to Vercel

1. Push your code to GitHub
2. Go to [Vercel](https://vercel.com)
3. Import your repository
4. Build settings are already configured in `vercel.json`
5. Add environment variables in Vercel dashboard
6. Deploy!

### Deploy to Firebase Hosting

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase Hosting:
   ```bash
   firebase init hosting
   ```
   - Select your Firebase project
   - Use `dist` as public directory
   - Configure as single-page app: Yes
   - Don't overwrite index.html

4. Build and deploy:
   ```bash
   npm run build
   firebase deploy
   ```

## Environment Variables

All environment variables must be prefixed with `VITE_` to be exposed to the client.

Required variables:
- `VITE_FIREBASE_API_KEY`
- `VITE_FIREBASE_AUTH_DOMAIN`
- `VITE_FIREBASE_PROJECT_ID`
- `VITE_FIREBASE_STORAGE_BUCKET`
- `VITE_FIREBASE_MESSAGING_SENDER_ID`
- `VITE_FIREBASE_APP_ID`
- `VITE_FIREBASE_MEASUREMENT_ID`

## Features to Add

Here are some ideas for extending the application:

- [ ] Event creation form for organizers
- [ ] User profile page
- [ ] Email notifications
- [ ] Search and filter events
- [ ] Event categories/tags
- [ ] QR code check-in
- [ ] Waitlist functionality
- [ ] Event analytics dashboard
- [ ] Social sharing
- [ ] Calendar integration

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
