import { Navigate } from "react-router-dom"
import { useAppContext } from "./hooks/useAppContext"

export function ProtectedRoute({ children }) {
  const { isAuth } = useAppContext()
  return isAuth ? children : <Navigate to="/" replace />
}
