class TicketMailer < ActionMailer::Base
  default :from => "notificacion-ticket-asignado@example.com"

  def ticket_asignado(ticket)
    @ticket = ticket
    @user = User.find(ticket.user_id)
    mail :to => @user.email, :subject => "Se te ha asignado un nuevo ticket"
  end
end
