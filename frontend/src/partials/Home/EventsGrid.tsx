import EventsCase from "./EventsCase";
import axiosInstance from "../../../axiosInstance";
import { useState, useEffect } from "react";

interface Event {
    id: number;
    titre: string;
    description: string;
    user_id: number;
    date_evenement: string;
    max_participants: number;
    lieu: string;
    inscriptions: unknown[];
}

export default function EventsGrid() {
  const [events, setEvents] = useState<Event[]>([]);

  useEffect(() => {
    axiosInstance.get("/event").then((res) => {
      setEvents(res?.data?.data);
    });
  }, []);
  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold">Les événements</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mt-4">
          {events.map((event)=> (
            <EventsCase key={event?.id} props={event} />
          ))}
      </div>
    </div>
  )
}
