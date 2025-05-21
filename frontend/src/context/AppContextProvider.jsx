import { useState, useEffect } from "react"
import { AppContext } from "./AppContext"

export function AppContextProvider({ children }) {
  const [darkMode, setDarkMode] = useState(false)
  const [isAuth, setIsAuthenticated] = useState(false)
  const [loading, _setLoading] = useState(false)
  const [sidebarExpanded, setSidebarExpanded] = useState(true)

  const toggleDarkMode = () => {
    setDarkMode(!darkMode)
    document.documentElement.classList.toggle("dark", !darkMode)
  }

  const toggleSidebar = () => {
    setSidebarExpanded(!sidebarExpanded)
  }

  useEffect(() => {
    const savedTheme = localStorage.getItem("darkMode")
    if (savedTheme) {
      const isDark = JSON.parse(savedTheme)
      setDarkMode(isDark)
      document.documentElement.classList.toggle("dark", isDark)
    }

    const savedSidebarState = localStorage.getItem("sidebarExpanded")
    if (savedSidebarState) {
      setSidebarExpanded(JSON.parse(savedSidebarState))
    }
  }, [])

  useEffect(() => {
    localStorage.setItem("sidebarExpanded", JSON.stringify(sidebarExpanded))
  }, [sidebarExpanded])

  return (
    <AppContext.Provider
      value={{
        darkMode,
        toggleDarkMode,
        isAuth,
        setIsAuthenticated,
        loading,
        sidebarExpanded,
        toggleSidebar,
      }}
    >
      {children}
    </AppContext.Provider>
  )
}
