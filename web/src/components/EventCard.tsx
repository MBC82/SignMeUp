import React from 'react';
import { Event } from '../types';
import './EventCard.css';

interface EventCardProps {
  event: Event;
}

const EventCard: React.FC<EventCardProps> = ({ event }) => {
  const formatDate = (date: Date) => {
    return new Intl.DateTimeFormat('en-US', {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    }).format(date);
  };

  const spotsLeft = event.capacity - event.registered;
  const percentFull = (event.registered / event.capacity) * 100;

  return (
    <div className="event-card card">
      <div className="event-card-header">
        <h3>{event.title}</h3>
        <span className={`event-status ${spotsLeft === 0 ? 'full' : 'available'}`}>
          {spotsLeft === 0 ? 'Full' : `${spotsLeft} spots left`}
        </span>
      </div>

      <div className="event-card-body">
        <p className="event-description">{event.description}</p>

        <div className="event-details">
          <div className="event-detail">
            <span className="detail-icon">📅</span>
            <span>{formatDate(event.date)}</span>
          </div>

          <div className="event-detail">
            <span className="detail-icon">📍</span>
            <span>{event.location}</span>
          </div>

          <div className="event-detail">
            <span className="detail-icon">👥</span>
            <span>{event.registered} / {event.capacity} registered</span>
          </div>
        </div>

        <div className="progress-bar">
          <div
            className="progress-fill"
            style={{ width: `${Math.min(percentFull, 100)}%` }}
          />
        </div>
      </div>

      <div className="event-card-footer">
        <button
          className="btn btn-primary"
          style={{ width: '100%' }}
          disabled={spotsLeft === 0}
        >
          {spotsLeft === 0 ? 'Event Full' : 'Register Now'}
        </button>
      </div>
    </div>
  );
};

export default EventCard;
