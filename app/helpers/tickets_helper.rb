module TicketsHelper
  NUEVO = 0
  ASIGNADO = 1
  CERRADO = 2

  def ver_estado(ticket)
    if ticket.estado == NUEVO
      "Nuevo"
    elsif ticket.estado == ASIGNADO
      "asignado a #{ticket.owner}" 
    elsif ticket.estado == CERRADO
      "CERRADO"
    end
  end
end