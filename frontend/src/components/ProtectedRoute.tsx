import type { ReactNode } from 'react';
import { Navigate } from 'react-router';

interface ProtectedRouteProps {
    children: ReactNode;
}

export default function ProtectedRoute({ children }: ProtectedRouteProps) {
    // Vérifier si le token existe dans le localStorage
    const token = localStorage.getItem('token');
    const user = localStorage.getItem('user');
    
    // Si pas de token, rediriger vers la page de connexion
    if (!token && !user) {
        return <Navigate to="/" replace />;
    }
    
    // Si token présent, afficher le contenu protégé
    return <>{children}</>;
} 