import type { ReactNode } from 'react';
import { Navigate } from 'react-router';

interface PublicRouteProps {
    children: ReactNode;
}

export default function PublicRoute({ children }: PublicRouteProps) {
    // Vérifier si le token existe dans le localStorage
    const token = localStorage.getItem('token');
    const user = localStorage.getItem('user');
    
    // Si token présent, rediriger vers la page d'accueil
    if (token && user) {
        return <Navigate to="/home" replace />;
    }
    
    // Si pas de token, afficher le contenu public
    return <>{children}</>;
} 