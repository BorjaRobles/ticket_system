class UsersController < ApplicationController
  def new
    @titulo = 'Registrate'
    @user = User.new
  end

  def show
    #session[:user_id]
    @user = User.find(params[:id])
    if @user
      @asignados = Ticket.where(:owner => @user.name)
    else
      redirect_to new_session_url, :notice => "IDENTIFICATE ANTES"
    end
  end
    
  def edit
    @user = User.find_by_id(session[:user_id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'Has actualizado tus datos !!!'
    else
      render "edit"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, :notice => "Signed up!"
    else
      render "new"
    end
  end
end