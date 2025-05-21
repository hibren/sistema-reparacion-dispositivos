import { NotificationCard } from "@/components/molecules/NotificationCard"
import { StatusBadge } from "@/components/molecules/StatusBadge"

export function Dashboard() {
  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-semibold flex items-center gap-2">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
          className="lucide lucide-layout-dashboard"
        >
          <rect width="7" height="9" x="3" y="3" rx="1" />
          <rect width="7" height="5" x="14" y="3" rx="1" />
          <rect width="7" height="9" x="14" y="12" rx="1" />
          <rect width="7" height="5" x="3" y="16" rx="1" />
        </svg>
        Resumen general
      </h2>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {/* Tarjetas de estadísticas */}
        <div className="bg-card text-card-foreground p-6 rounded-lg shadow">
          <h3 className="text-sm font-medium text-muted-foreground">Reparaciones en curso</h3>
          <div className="flex justify-between items-center mt-2">
            <p className="text-3xl font-bold">10</p>
            <div className="p-2 bg-info/20 rounded-md">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="text-info"
              >
                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
              </svg>
            </div>
          </div>
        </div>

        <div className="bg-card text-card-foreground p-6 rounded-lg shadow">
          <h3 className="text-sm font-medium text-muted-foreground">Reparaciones listas para entrega</h3>
          <div className="flex justify-between items-center mt-2">
            <p className="text-3xl font-bold">2</p>
            <div className="p-2 bg-success/20 rounded-md">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="text-success"
              >
                <path d="M20 6 9 17l-5-5" />
              </svg>
            </div>
          </div>
          <div className="mt-4">
            <StatusBadge status="success">Listas para entrega</StatusBadge>
          </div>
        </div>

        <div className="bg-card text-card-foreground p-6 rounded-lg shadow">
          <h3 className="text-sm font-medium text-muted-foreground">Reparaciones demoradas</h3>
          <div className="flex justify-between items-center mt-2">
            <p className="text-3xl font-bold">1</p>
            <div className="p-2 bg-destructive/20 rounded-md">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="text-destructive"
              >
                <circle cx="12" cy="12" r="10" />
                <line x1="12" x2="12" y1="8" y2="12" />
                <line x1="12" x2="12.01" y1="16" y2="16" />
              </svg>
            </div>
          </div>
          <div className="mt-4">
            <StatusBadge status="error">Demoradas</StatusBadge>
          </div>
        </div>
      </div>

      <h2 className="text-2xl font-semibold mt-8 flex items-center gap-2">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
          className="lucide lucide-bell"
        >
          <path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9" />
          <path d="M10.3 21a1.94 1.94 0 0 0 3.4 0" />
        </svg>
        Últimas notificaciones
      </h2>

      <div className="space-y-4">
        {/* Notificaciones con los nuevos componentes */}
        <NotificationCard
          type="warning"
          message="Stock crítico: solo quedan 2 baterías para Moto G8 disponibles."
          onClick={() => console.log("Notificación 1 clickeada")}
        />

        <NotificationCard
          type="info"
          message="Nuevo dispositivo ingresado sin técnico asignado (Reparación #6)."
          onClick={() => console.log("Notificación 2 clickeada")}
        />

        <NotificationCard
          type="error"
          message="Reparación #2 lleva 3 días en espera por repuesto (Pantalla iPhone XR)."
          onClick={() => console.log("Notificación 3 clickeada")}
        />
      </div>

      <div className="flex justify-center mt-6">
        <button className="px-4 py-2 bg-primary hover:bg-primary/90 text-primary-foreground rounded-md transition-colors">
          Cargar más
        </button>
      </div>
    </div>
  )
}
