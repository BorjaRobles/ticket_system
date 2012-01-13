class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :login_required, :get_user
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def login_required
    redirect_to root_path, :alert=>'Identificate para poder acceder a eta seccion' unless current_user    
  end
  
  def get_user
    @user = User.find(params[:id])
  end  
end
