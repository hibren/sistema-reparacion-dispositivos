import { cn } from "@/lib/utils"

export function StatusBadge({ status, className, ...props }) {
  const statusClasses = {
    success: "status-badge-success",
    warning: "status-badge-warning",
    error: "status-badge-error",
    info: "status-badge-info",
    pending: "status-badge-pending",
  }

  const statusText = {
    success: "Completado",
    warning: "En espera",
    error: "Error",
    info: "Información",
    pending: "Pendiente",
  }

  return (
    <span className={cn("status-badge", statusClasses[status] || statusClasses.pending, className)} {...props}>
      {props.children || statusText[status] || "Estado"}
    </span>
  )
}
