import React from 'react';
import { Link } from 'react-router-dom';
import './Landing.css';

const Landing: React.FC = () => {
  return (
    <div className="landing">
      {/* Hero Section */}
      <section className="hero">
        <div className="container">
          <div className="hero-content">
            <h1 className="hero-title">
              Event Registration Made <span className="highlight">Simple</span>
            </h1>
            <p className="hero-subtitle">
              Create, manage, and track event registrations with ease.
              Perfect for conferences, workshops, meetups, and more.
            </p>
            <div className="hero-actions">
              <Link to="/signup" className="btn btn-primary btn-large">
                Get Started Free
              </Link>
              <Link to="/events" className="btn btn-secondary btn-large">
                Browse Events
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="features">
        <div className="container">
          <h2 className="section-title">Why Choose SignMeUp?</h2>
          <div className="features-grid">
            <div className="feature-card">
              <div className="feature-icon">⚡</div>
              <h3>Lightning Fast</h3>
              <p>Register for events in seconds with our streamlined process</p>
            </div>

            <div className="feature-card">
              <div className="feature-icon">🔒</div>
              <h3>Secure & Reliable</h3>
              <p>Your data is protected with enterprise-grade security</p>
            </div>

            <div className="feature-card">
              <div className="feature-icon">📊</div>
              <h3>Real-time Updates</h3>
              <p>Track registrations and capacity in real-time</p>
            </div>

            <div className="feature-card">
              <div className="feature-icon">📱</div>
              <h3>Mobile Friendly</h3>
              <p>Works perfectly on all devices, anywhere, anytime</p>
            </div>

            <div className="feature-card">
              <div className="feature-icon">✉️</div>
              <h3>Email Notifications</h3>
              <p>Automatic confirmations and reminders for attendees</p>
            </div>

            <div className="feature-card">
              <div className="feature-icon">📈</div>
              <h3>Analytics</h3>
              <p>Gain insights with detailed registration analytics</p>
            </div>
          </div>
        </div>
      </section>

      {/* How It Works Section */}
      <section className="how-it-works">
        <div className="container">
          <h2 className="section-title">How It Works</h2>
          <div className="steps">
            <div className="step">
              <div className="step-number">1</div>
              <h3>Create Account</h3>
              <p>Sign up for free in less than a minute</p>
            </div>

            <div className="step">
              <div className="step-number">2</div>
              <h3>Find Events</h3>
              <p>Browse events or create your own</p>
            </div>

            <div className="step">
              <div className="step-number">3</div>
              <h3>Register</h3>
              <p>Sign up with just a few clicks</p>
            </div>

            <div className="step">
              <div className="step-number">4</div>
              <h3>Attend</h3>
              <p>Get reminders and enjoy the event</p>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="cta">
        <div className="container">
          <h2>Ready to Get Started?</h2>
          <p>Join thousands of event organizers and attendees already using SignMeUp</p>
          <Link to="/signup" className="btn btn-primary btn-large">
            Create Free Account
          </Link>
        </div>
      </section>
    </div>
  );
};

export default Landing;
