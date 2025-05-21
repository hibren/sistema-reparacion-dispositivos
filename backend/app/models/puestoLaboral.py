from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from app.database import Base

class PuestoLaboral(Base):
    __tablename__ = "puestoLaboral"

    idpuestoLaboral = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nombrepuestoLaboral = Column(String(45), nullable=True)

    empleados = relationship("Empleado", back_populates="puesto")
