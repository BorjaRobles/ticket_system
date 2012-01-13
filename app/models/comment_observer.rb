class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    CommentMailer.nuevo_comentario(comment.ticket.user.name, comment.ticket.user.email).deliver
    comment.ticket.comments.each do |comment|
      user = User.find(comment.user_id)
      CommentMailer.nuevo_comentario(user.name, user.email).deliver if user.id != comment.ticket.user_id
    end
  end
  
  def after_update(comment)
    ticket = Ticket.find(comment.ticket_id)
    CommentMailer.nuevo_comentario(comment.ticket.user.name, ticket.user.email).deliver
    
    ticket.comments.each do |comment|
      user = User.find(comment.user_id)
      CommentMailer.nuevo_comentario(user.name, user.email).deliver if user.id != elticket.user_id
    end
  end
end

    
