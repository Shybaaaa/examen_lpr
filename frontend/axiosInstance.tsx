import axios from 'axios'

const axiosInstance = axios.create({
    baseURL: 'http://localhost:8000/api',
    timeout: 10000,
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'App-Token': 'TOKEN_EXAMEN_123456',
    }
})

axiosInstance.interceptors.response.use(
    (response) => response,
    (error) => {
        console.warn("API Error:", error);
        return Promise.reject(error);
    }
);

axiosInstance.interceptors.request.use(
    config => {
        const token = localStorage.getItem('token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    error => {
        return Promise.reject(error);
    },
)

export default axiosInstance;