class TicketObserver < ActiveRecord::Observer
  def after_create
    TicketMailer.ticket_asignado(@ticket).deliver
  end
end
