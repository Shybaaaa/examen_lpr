import { useFormik } from "formik";
import * as Yup from "yup";
import axiosInstance from "../../../axiosInstance";
import toast from "react-hot-toast";
import { useNavigate, useParams } from "react-router";
import { useState, useEffect } from "react";
import Navbar from "../../components/Navbar/Navbar";

export default function CreateEvent() {
    const navigate = useNavigate();
    const { id } = useParams();
    const [isLoading, setIsLoading] = useState(false);
    const [isEditMode, setIsEditMode] = useState(false);
    
    const formik = useFormik({
        initialValues: {
            titre: "",
            description: "",
            date_evenement: "",
            max_participants: "",
            lieu: "",
        },
        validationSchema: Yup.object({
            titre: Yup.string()
                .required("Le titre est requis.")
                .max(255, "Le titre ne peut pas dépasser 255 caractères."),
            description: Yup.string()
                .required("La description est requise.")
                .max(255, "La description ne peut pas dépasser 255 caractères."),
            date_evenement: Yup.date()
                .required("La date de l'événement est requise.")
                .min(new Date(), "La date de l'événement doit être dans le futur."),
            max_participants: Yup.number()
                .required("Le nombre maximum de participants est requis.")
                .positive("Le nombre de participants doit être positif.")
                .integer("Le nombre de participants doit être un entier."),
            lieu: Yup.string()
                .required("Le lieu est requis.")
                .max(255, "Le lieu ne peut pas dépasser 255 caractères."),
        }),
        onSubmit: async (values) => {
            try {
                // Récupérer l'utilisateur depuis le localStorage
                const userString = localStorage.getItem('user');
                let userId = null;
                let roleId = null;
                
                if (userString) {
                    try {
                        const user = JSON.parse(userString);
                        userId = user.id;
                        roleId = user.role_id;
                    } catch (error) {
                        console.error("Erreur lors du parsing de l'utilisateur:", error);
                    }
                }
                
                if (!userId) {
                    toast.error("Erreur d'authentification. Veuillez vous reconnecter.");
                    return;
                }

                // Préparer les données pour l'API
                const eventData = {
                    ...values,
                    user_id: userId,
                    role_id: roleId,
                    max_participants: parseInt(values.max_participants),
                };

                let response;
                if (isEditMode && id) {
                    // Mode modification
                    response = await axiosInstance.put(`/event/${id}`, eventData);
                    toast.success(response?.data?.message || "Événement modifié avec succès !");
                } else {
                    // Mode création
                    response = await axiosInstance.post("/event", eventData);
                    toast.success(response?.data?.message || "Événement créé avec succès !");
                }
                
                navigate("/home");
            } catch (error: unknown) {
                const errorResponse = error as { response?: { data?: { message?: string } } };
                toast.error(errorResponse?.response?.data?.message || "Une erreur s'est produite");
            }
        },
    });

    // Charger les données de l'événement si on est en mode édition
    useEffect(() => {
        const loadEventData = async () => {
            if (id) {
                setIsLoading(true);
                setIsEditMode(true);
                
                try {
                    const response = await axiosInstance.get(`/event/${id}`);
                    const eventData = response?.data?.data;
                    
                    if (eventData) {
                        // Formater la date pour l'input datetime-local
                        const eventDate = new Date(eventData.date_evenement);
                        const formattedDate = eventDate.toISOString().slice(0, 16);
                        
                        // Mettre à jour les valeurs du formulaire
                        formik.setValues({
                            titre: eventData.titre || "",
                            description: eventData.description || "",
                            date_evenement: formattedDate,
                            max_participants: eventData.max_participants?.toString() || "",
                            lieu: eventData.lieu || "",
                        });
                        
                        console.log("Données chargées:", eventData); // Debug
                    } else {
                        toast.error("Aucune donnée trouvée pour cet événement");
                        // navigate("/home");
                    }
                } catch (error: unknown) {
                    const errorResponse = error as { response?: { data?: { message?: string } } };
                    toast.error(errorResponse?.response?.data?.message || "Erreur lors du chargement de l'événement");
                    // navigate("/home");
                } finally {
                    setIsLoading(false);
                }
            }
        };

        loadEventData();
    }, [id, formik.setValues, navigate]);

    // Debug: Afficher les valeurs du formulaire quand elles changent
    useEffect(() => {
        if (isEditMode) {
            console.log("Valeurs actuelles du formulaire:", formik.values);
        }
    }, [formik.values, isEditMode]);

    // Fonction pour supprimer l'événement
    const handleDelete = async () => {
        if (!id) return;
        
        // Confirmation de suppression
        if (!window.confirm("Êtes-vous sûr de vouloir supprimer cet événement ? Cette action est irréversible.")) {
            return;
        }
        
        try {
            const response = await axiosInstance.delete(`/event/${id}`);
            toast.success(response?.data?.message || "Événement supprimé avec succès !");
            navigate("/home");
        } catch (error: unknown) {
            const errorResponse = error as { response?: { data?: { message?: string } } };
            toast.error(errorResponse?.response?.data?.message || "Erreur lors de la suppression de l'événement");
        }
    };

    if (isLoading) {
        return (
            <div className="min-h-screen bg-gray-50">
                <Navbar />
                <div className="flex justify-center items-center h-64">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500"></div>
                </div>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-gray-50">
            <Navbar />
            <div className="flex flex-col items-center justify-center px-4 py-8">
                <div className="flex flex-col gap-4 w-full max-w-md sm:max-w-lg md:max-w-xl lg:max-w-2xl bg-white p-6 sm:p-8 md:p-12 lg:p-16 rounded-2xl sm:rounded-3xl lg:rounded-4xl shadow-md">
                    <h1 className="text-xl sm:text-2xl lg:text-3xl text-center font-bold">
                        {isEditMode ? "Modifier l'événement" : "Créer un événement"}
                    </h1>
                    
                    <form onSubmit={formik.handleSubmit} className="flex flex-col gap-4 sm:gap-5">
                        {/* Titre */}
                        <div className="flex flex-col gap-2">
                            <label htmlFor="titre" className="text-sm font-bold">Titre de l'événement</label>
                            <input 
                                type="text" 
                                className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base focus:border-blue-500 focus:outline-none transition-colors" 
                                id="titre" 
                                name="titre" 
                                placeholder="Ex: Soirée networking"
                                value={formik.values.titre} 
                                onChange={formik.handleChange} 
                                onBlur={formik.handleBlur} 
                            />
                            {formik.errors.titre && formik.touched.titre && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.titre}</p>}
                        </div>

                        {/* Description */}
                        <div className="flex flex-col gap-2">
                            <label htmlFor="description" className="text-sm font-bold">Description</label>
                            <textarea 
                                className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base focus:border-blue-500 focus:outline-none transition-colors resize-none" 
                                id="description" 
                                name="description" 
                                rows={3}
                                placeholder="Décrivez votre événement..."
                                value={formik.values.description} 
                                onChange={formik.handleChange} 
                                onBlur={formik.handleBlur} 
                            />
                            {formik.errors.description && formik.touched.description && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.description}</p>}
                        </div>

                        {/* Lieu */}
                        <div className="flex flex-col gap-2">
                            <label htmlFor="lieu" className="text-sm font-bold">Lieu</label>
                            <input 
                                type="text" 
                                className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base focus:border-blue-500 focus:outline-none transition-colors" 
                                id="lieu" 
                                name="lieu" 
                                placeholder="Ex: Paris, France"
                                value={formik.values.lieu} 
                                onChange={formik.handleChange} 
                                onBlur={formik.handleBlur} 
                            />
                            {formik.errors.lieu && formik.touched.lieu && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.lieu}</p>}
                        </div>

                        {/* Date et Participants */}
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div className="flex flex-col gap-2">
                                <label htmlFor="date_evenement" className="text-sm font-bold">Date de l'événement</label>
                                <input 
                                    type="datetime-local" 
                                    className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base focus:border-blue-500 focus:outline-none transition-colors" 
                                    id="date_evenement" 
                                    name="date_evenement" 
                                    value={formik.values.date_evenement} 
                                    onChange={formik.handleChange} 
                                    onBlur={formik.handleBlur} 
                                />
                                {formik.errors.date_evenement && formik.touched.date_evenement && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.date_evenement}</p>}
                            </div>

                            <div className="flex flex-col gap-2">
                                <label htmlFor="max_participants" className="text-sm font-bold">Participants max</label>
                                <input 
                                    type="number" 
                                    className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base focus:border-blue-500 focus:outline-none transition-colors" 
                                    id="max_participants" 
                                    name="max_participants" 
                                    placeholder="Ex: 50"
                                    min="1"
                                    value={formik.values.max_participants} 
                                    onChange={formik.handleChange} 
                                    onBlur={formik.handleBlur} 
                                />
                                {formik.errors.max_participants && formik.touched.max_participants && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.max_participants}</p>}
                            </div>
                        </div>

                        {/* Boutons d'action */}
                        <div className="flex flex-col sm:flex-row gap-4 mt-4">
                            {/* Bouton de suppression (visible uniquement en mode édition) */}
                            {isEditMode && (
                                <button 
                                    type="button"
                                    onClick={handleDelete}
                                    className="bg-gradient-to-r from-red-500 to-red-600 hover:from-red-600 hover:to-red-700 transition-all duration-300 text-white p-2 sm:p-3 rounded-xl font-bold shadow-md text-sm sm:text-base flex-1"
                                >
                                    Supprimer l'événement
                                </button>
                            )}
                            
                            {/* Bouton de soumission */}
                            <button 
                                type="submit" 
                                className="bg-gradient-to-r from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700 transition-all duration-300 text-white p-2 sm:p-3 rounded-xl font-bold shadow-md text-sm sm:text-base flex-1"
                            >
                                {isEditMode ? "Modifier l'événement" : "Créer l'événement"}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}
