import { AlertCircle, CheckCircle, Info, AlertTriangle, ChevronRight } from "lucide-react"
import { cn } from "@/lib/utils"

export function NotificationCard({ type = "info", message, onClick, className, ...props }) {
  const typeConfig = {
    info: {
      icon: Info,
      className: "text-info",
      cardClass: "notification-card-info",
    },
    success: {
      icon: CheckCircle,
      className: "text-success",
      cardClass: "notification-card-success",
    },
    warning: {
      icon: AlertTriangle,
      className: "text-warning",
      cardClass: "notification-card-warning",
    },
    error: {
      icon: AlertCircle,
      className: "text-destructive",
      cardClass: "notification-card-error",
    },
  }

  const config = typeConfig[type] || typeConfig.info
  const Icon = config.icon

  return (
    <div className={cn("notification-card", config.cardClass, className)} onClick={onClick} {...props}>
      <div className="flex items-center gap-3">
        <Icon className={cn("w-5 h-5", config.className)} />
        <p className="text-card-foreground">{message}</p>
      </div>
      <ChevronRight className={cn("w-5 h-5", config.className)} />
    </div>
  )
}
