class CommentObserver < ActiveRecord::Observer
  def after_create(comentario)
    CommentMailer.nuevo_comentario(comentario.ticket.user.name, comentario.ticket.user.email).deliver
    comentario.ticket.comentarios.each do |elcomentario|
      user = User.find(elcomentario.user_id)
      CommentMailer.nuevo_comentario(user.name, user.email).deliver if user.id != comentario.ticket.user_id
    end
  end
  
  def after_update(comentario)
    elticket = Ticket.find(comentario.ticket_id)
    CommentMailer.nuevo_comentario(comentario.ticket.user.name, elticket.user.email).deliver
        
    #elticket = Ticket.find(params[:ticket_id])
    #ComentarioMailer.nuevo_comentario(comentario.ticket.user.name, elticket.user.email).deliver
    elticket.comentarios.each do |coment|
      user = User.find(coment.user_id)
      CommentMailer.nuevo_comentario(user.name, user.email).deliver if user.id != elticket.user_id
    end
  end
end

    
