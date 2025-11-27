import React, { useState, useEffect } from 'react';
import { collection, getDocs, query, orderBy } from 'firebase/firestore';
import { db } from '../config/firebase';
import { Event } from '../types';
import EventCard from '../components/EventCard';
import './Events.css';

const Events: React.FC = () => {
  const [events, setEvents] = useState<Event[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchEvents();
  }, []);

  const fetchEvents = async () => {
    try {
      const eventsQuery = query(
        collection(db, 'events'),
        orderBy('date', 'asc')
      );
      const querySnapshot = await getDocs(eventsQuery);
      const eventsData = querySnapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data(),
        date: doc.data().date.toDate(),
        createdAt: doc.data().createdAt.toDate()
      })) as Event[];

      setEvents(eventsData);
    } catch (err: any) {
      setError(err.message || 'Failed to fetch events');
      console.error('Error fetching events:', err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="events-page">
        <div className="container">
          <div className="loading">Loading events...</div>
        </div>
      </div>
    );
  }

  return (
    <div className="events-page">
      <div className="container">
        <div className="events-header">
          <h1>Upcoming Events</h1>
          <p>Browse and register for upcoming events</p>
        </div>

        {error && <div className="alert alert-error">{error}</div>}

        {events.length === 0 ? (
          <div className="empty-state">
            <div className="empty-icon">📅</div>
            <h2>No events available</h2>
            <p>Check back soon for upcoming events!</p>
          </div>
        ) : (
          <div className="events-grid">
            {events.map(event => (
              <EventCard key={event.id} event={event} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default Events;
