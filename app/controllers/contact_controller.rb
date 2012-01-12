class ContactController < ApplicationController
  def show
    @titulo = "Contactanos"
    if params[:email] && params[:name] && params[:texto]      
      ContactMailer.contact_request(params[:email],params[:name],params[:texto]).deliver
      ContactMailer.contact_email(params[:email],params[:name],params[:texto]).deliver
    else
      render 'show'
    end
  end
end
