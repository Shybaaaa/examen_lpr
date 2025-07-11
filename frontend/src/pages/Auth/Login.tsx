import { useFormik } from "formik";
import * as Yup from "yup";
import axiosInstance from "../../../axiosInstance";
import toast from "react-hot-toast";
import { Link, useNavigate } from "react-router";


export default function Login() {
    const navigate = useNavigate();
    const formik = useFormik({
        initialValues: {
            email: "",
            password: "",
        },
        validationSchema: Yup.object({
            email: Yup.string().email("L'email est invalide.").required("L'Email est requis."),
            password: Yup.string().min(8, "Le mot de passe doit contenir au moins 8 caractères.").required("Le mot de passe est requis."),
        }),
        onSubmit: async (values) => {
            try {
                const response = await axiosInstance.post("/user/l", values);
                localStorage.setItem("token", response?.data?.data?.token);
                localStorage.setItem("user", JSON.stringify(response?.data?.data?.user));
                toast.success(response?.data?.message);
                navigate("/home");
            } catch (error: unknown) {
                const errorResponse = error as { response?: { data?: { message?: string } } };
                toast.error(errorResponse?.response?.data?.message || "Une erreur s'est produite");
            }
        },
    });
    return (
        <div className="flex flex-col items-center justify-center min-h-screen bg-gray-50 px-4 py-8">
            <div className="flex flex-col gap-4 w-full max-w-md sm:max-w-lg md:max-w-xl lg:max-w-2xl bg-white p-6 sm:p-8 md:p-12 lg:p-16 rounded-2xl sm:rounded-3xl lg:rounded-4xl shadow-md">
                <h1 className="text-xl sm:text-2xl lg:text-3xl text-center font-bold">Connexion</h1>
                <form onSubmit={formik.handleSubmit} className="flex flex-col gap-4 sm:gap-5">
                    <div className="flex flex-col gap-2">
                        <label htmlFor="email" className="text-sm font-bold">Email</label>
                        <input 
                            type="email" 
                            className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base" 
                            id="email" 
                            name="email" 
                            value={formik.values.email} 
                            onChange={formik.handleChange} 
                            onBlur={formik.handleBlur} 
                        />
                        {formik.errors.email && formik.touched.email && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.email}</p>}
                    </div>
                    <div className="flex flex-col gap-2">
                        <label htmlFor="password" className="text-sm font-bold">Mot de passe</label>
                        <input 
                            type="password" 
                            className="border-2 border-gray-300 rounded-md p-2 sm:p-3 text-sm sm:text-base" 
                            id="password" 
                            name="password" 
                            value={formik.values.password} 
                            onChange={formik.handleChange} 
                            onBlur={formik.handleBlur} 
                        />
                        {formik.errors.password && formik.touched.password && <p className="text-red-500 text-xs sm:text-sm">{formik.errors.password}</p>}
                    </div>
                    <button 
                        type="submit" 
                        className="bg-gradient-to-r from-blue-500 to-blue-600 hover:bg-blue-700 transition-all duration-300 text-white p-2 sm:p-3 rounded-xl font-bold shadow-md text-sm sm:text-base"
                    >
                        Connexion
                    </button>
                    <p className="text-xs sm:text-sm text-center">Vous n'avez pas de compte ? <Link to={'/register'} className="text-blue-500 cursor-pointer hover:text-blue-600">Inscription</Link></p>
                </form>
            </div>
        </div>
    )
}
