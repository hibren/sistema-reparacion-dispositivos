import React from "react"
import ReactDOM from "react-dom/client"
import { BrowserRouter } from "react-router-dom"
import App from "./App"
import "./index.css"

const router = {
  future: {
    v7_relativeSplatPath: true,
  },
}

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <BrowserRouter future={router}>
      <App />
    </BrowserRouter>
  </React.StrictMode>,
)
