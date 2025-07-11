import { Link } from "react-router";
// import axiosInstance from "../../../axiosInstance";
import { useNavigate } from "react-router";
import toast from "react-hot-toast";
import { useState, useEffect } from "react";

export default function Navbar() {
    const navigate = useNavigate();
    const [userRole, setUserRole] = useState<number | null>(null);
    const [userName, setUserName] = useState<string>("");

    // Récupérer les informations de l'utilisateur au chargement
    useEffect(() => {
        const userString = localStorage.getItem('user');
        if (userString) {
            try {
                const user = JSON.parse(userString);
                setUserRole(user.role_id);
                setUserName(user.name_utilisateur || user.name || "Utilisateur");
            } catch (error) {
                console.error("Erreur lors du parsing de l'utilisateur:", error);
            }
        }
    }, []);

    async function handleLogout() {
        try {
            localStorage.removeItem("token");
            localStorage.removeItem("user");
            setUserRole(null);
            setUserName("");
            toast.success("Déconnexion réussie");
            navigate("/");
        } catch (error: unknown) {
            const errorResponse = error as { response?: { data?: { message?: string } } };
            toast.error(errorResponse?.response?.data?.message || "Une erreur s'est produite");
        }
    }

    return (
        <div className="flex justify-between items-center p-4 bg-white shadow-md">
            <Link to="/home" className="text-2xl font-bold text-blue-600">Eventify</Link>
            
            <div className="flex items-center gap-4">
                {/* Liens conditionnels selon le rôle */}
                {userRole === 2 && ( // Admin
                    <>
                        <Link to="/create-event" className="text-gray-800 px-4 py-2 rounded-md font-bold hover:text-blue-600 transition-all duration-300 hover:scale-105 cursor-pointer">
                            Créer un événement
                        </Link>
                        <Link to="/my-reservations" className="text-gray-800 px-4 py-2 rounded-md font-bold hover:text-blue-600 transition-all duration-300 hover:scale-105 cursor-pointer">
                            Mes réservations
                        </Link>
                    </>
                )}
                {userRole === 1 && ( // Utilisateur normal
                    <Link to="/my-reservations" className="text-gray-800 px-4 py-2 rounded-md font-bold hover:text-blue-600 transition-all duration-300 hover:scale-105 cursor-pointer">
                        Mes réservations
                    </Link>
                )}
            </div>
            
            <div className="flex items-center gap-4">
                {/* Affichage du nom d'utilisateur */}
                {userName && (
                    <span className="text-gray-600 font-medium">
                        Bonjour, {userName}
                    </span>
                )}
                
                {/* Badge du rôle */}
                {userRole && (
                    <span className={`px-2 py-1 rounded-full text-xs font-bold ${
                        userRole === 2 ? 'bg-red-100 text-red-800' :
                        userRole === 1 ? 'bg-blue-100 text-blue-800' :
                        'bg-green-100 text-green-800'
                    }`}>
                        {userRole === 2 ? 'Admin' :
                         'Utilisateur'}
                    </span>
                )}
                
                <button 
                    onClick={handleLogout} 
                    className="bg-red-500 text-white px-4 py-2 rounded-md font-bold hover:bg-red-600 transition-all duration-300 hover:scale-105 cursor-pointer"
                >
                    Déconnexion
                </button>
            </div>
        </div>
    )
}
