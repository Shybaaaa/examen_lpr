// Imports
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter as Router, Routes, Route } from 'react-router'
import { Toaster } from 'react-hot-toast'

// CSS
import './assets/css/index.css'

// Components
import ProtectedRoute from './components/ProtectedRoute'
import PublicRoute from './components/PublicRoute'

// Pages
import Login from './pages/Auth/Login'
import Register from './pages/Auth/Register'
import Home from './pages/Home/Home'
import Myreservations from './pages/Myreservations/Myreservations'
import CreateEvent from './pages/CreateEvent/CreateEvent'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
      <Router>
        <Routes>
          <Route path="/" element={
            <PublicRoute>
              <Login />
            </PublicRoute>
          } />
          <Route path="/register" element={
            <PublicRoute>
              <Register />
            </PublicRoute>
          } />

          <Route path="/home" element={
            <ProtectedRoute>
              <Home />
            </ProtectedRoute>
          } />

          <Route path='/my-reservations' element={
            <ProtectedRoute>
              <Myreservations />
            </ProtectedRoute>
          } />

          <Route path='/create-event/:id' element={
            <ProtectedRoute>
              <CreateEvent />
            </ProtectedRoute>
          } />

          <Route path='/create-event' element={
            <ProtectedRoute>
              <CreateEvent />
            </ProtectedRoute>
          } />
        </Routes>
      </Router>
      <Toaster
        position="top-right"
        toastOptions={{
          duration: 4000,
          style: {
            background: '#fff',
            color: '#363636',
            padding: '16px',
            borderRadius: '8px',
            fontSize: '16px',
            fontWeight: 'bold',
            textAlign: 'center',
            boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
            zIndex: 9999,
          },
        }}
      />
  </StrictMode>
)
