module TicketsHelper
  def ver_estado(ticket)
    if ticket.estado == Ticket::NUEVO
      "Nuevo"
    elsif ticket.estado == Ticket::ASIGNADO
      "asignado a #{ticket.owner}" 
    elsif ticket.estado == Ticket::CERRADO
      "CERRADO"
    end
  end
end