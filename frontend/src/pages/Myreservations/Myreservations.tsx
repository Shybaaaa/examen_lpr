import { useEffect, useState } from "react";
import axiosInstance from "../../../axiosInstance";
import Navbar from "../../components/Navbar/Navbar";
import ReservationCase from "../../partials/Myreservations/ReservationCase";

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

interface Inscription {
    id: number;
    evenement: Event;
}

export default function Myreservations() {
    const [inscriptions, setInscriptions] = useState<Inscription[]>([]);

    useEffect(() => {
        // Récupérer l'utilisateur depuis le localStorage
        const userString = localStorage.getItem('user');
        let userId = null;
        
        if (userString) {
            try {
                const user = JSON.parse(userString);
                userId = user.id;
            } catch (error) {
                console.error("Erreur lors du parsing de l'utilisateur:", error);
            }
        }
        
        if (!userId) {
            console.error("Utilisateur non trouvé dans le localStorage");
            return;
        }

        axiosInstance.get("/inscription", {
            params: {
                user_id: userId
            }
        }).then((res) => {
            setInscriptions(res?.data?.data);
        }).catch((err) => {
            console.error("Erreur lors de la récupération des réservations:", err);
        });
    }, []);
    return (
        <div>
            <Navbar />
            <div className="flex flex-col items-center justify-center p-6">
                <h1 className="text-2xl font-bold">Mes réservations</h1>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {inscriptions?.map((inscription) => (
                        <ReservationCase key={inscription?.id} inscription_id={inscription?.id} props={inscription?.evenement} />
                    ))}
                </div>
            </div>
        </div>
    ) 
}
