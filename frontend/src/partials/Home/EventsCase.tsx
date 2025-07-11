import toast from "react-hot-toast";
import axiosInstance from "../../../axiosInstance";
import { useState, useEffect } from "react";
import { useNavigate } from "react-router";

interface EventProps {
    titre: string;
    description: string;
    user_id: number;
    date_evenement: string;
    max_participants: number;
    lieu: string;
    id: number;
    inscriptions: unknown[]; // Ajout de la propriété inscriptions
}

export default function EventsCase({ props }: { props: EventProps }) {
    const navigate = useNavigate();
    const [userRole, setUserRole] = useState<number | null>(null);
    
    // Récupérer les informations de l'utilisateur au chargement
    useEffect(() => {
        const userString = localStorage.getItem('user');
        if (userString) {
            try {
                const user = JSON.parse(userString);
                setUserRole(user.role_id);
            } catch (error) {
                console.error("Erreur lors du parsing de l'utilisateur:", error);
            }
        }
    }, []);
    
    // Formater la date
    const formatDate = (dateString: string) => {
        const date = new Date(dateString);
        return date.toLocaleDateString('fr-FR', {
            day: 'numeric',
            month: 'long',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    };

    const handleInscription = (event_id: number) => {
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
        
        axiosInstance.post(`/inscription`, {
            'user_id': userId,
            'evenement_id': event_id
        }).then((res) => {
            toast.success(res?.data?.message);
        }).catch((err) => {
            toast.error(err?.response?.data?.message);
        });
    }

    const handleModifier = (event_id: number) => {
        // Navigation vers la page de modification
        navigate(`/create-event/${event_id}`);
    }

    // Vérifier si l'utilisateur peut modifier cet événement
    const canModify = userRole === 2;

    return (
        <div className="bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 p-6 border border-gray-100">
            <div className="flex flex-col gap-4">
                {/* En-tête avec titre et lieu */}
                <div className="flex flex-col gap-2">
                    <h2 className="text-xl font-bold text-gray-800 line-clamp-2">{props?.titre}</h2>
                    <div className="flex items-center gap-2 text-gray-600">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        <span className="text-sm font-medium">{props?.lieu}</span>
                    </div>
                </div>

                {/* Description */}
                <p className="text-gray-600 text-sm line-clamp-3 leading-relaxed">
                    {props?.description}
                </p>

                {/* Informations de l'événement */}
                <div className="flex flex-wrap gap-4 text-sm text-gray-500">
                    <div className="flex items-center gap-1">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                        <span>{formatDate(props?.date_evenement)}</span>
                    </div>
                    <div className="flex items-center gap-1">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                        <span>Max {props?.max_participants} participants</span>
                    </div>
                    <div className="flex items-center gap-1">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z" />
                        </svg>
                        <span>{props?.inscriptions?.length || 0} inscrit(s)</span>
                    </div>
                </div>

                {/* Boutons d'action */}
                <div className="flex justify-between items-center pt-2">
                    {/* Bouton Modifier pour les organisateurs */}
                    {canModify && (
                        <button 
                            onClick={() => handleModifier(props?.id)} 
                            className="bg-gradient-to-r from-green-500 to-green-600 hover:from-green-600 hover:to-green-700 text-white px-4 py-2 rounded-lg font-semibold transition-all duration-300 hover:scale-105 transform cursor-pointer shadow-md hover:shadow-lg"
                        >
                            Modifier
                        </button>
                    )}
                    
                    {/* Bouton S'inscrire (aligné à droite) */}
                    <div className="flex-1 flex justify-end">
                        <button 
                            onClick={() => handleInscription(props?.id)} 
                            className="bg-gradient-to-r from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700 text-white px-6 py-2 rounded-lg font-semibold transition-all duration-300 hover:scale-105 transform cursor-pointer shadow-md hover:shadow-lg"
                        >
                            S'inscrire
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
