class UsersController < ApplicationController
  before_filter :login_required, :only=>[:show, :edit, :update]
  before_filter :get_user, :only=>[:show, :edit, :update]
  def new
    @titulo = 'Registrate'
    @user = User.new
  end

  def show
    @asignados = Ticket.where(:owner => @user.name)
  end
    
  def edit
  end
  
  def update
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