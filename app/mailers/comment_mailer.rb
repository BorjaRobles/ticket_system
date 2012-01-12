class CommentMailer < ActionMailer::Base
  default :from => "no-reply@example.com"

  def nuevo_comentario(user, email)
    @usuario = user  
    mail :to => email
  end
end


