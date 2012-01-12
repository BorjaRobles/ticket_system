class ContactMailer < ActionMailer::Base
  default :from => "no-reply@example.com"
  
  def contact_request(email, name, texto)
    mail :to => email
    @name = nombre
  end
  
  def contact_email(email, name, texto)
    mail :to => 'EmailDelAdministrador@gmail.com'
    @email = email
    @name = name
    @texto = texto
  end
  
  #def admin_request(email)
   # mail :to => email
  #end
end
