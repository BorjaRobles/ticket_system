class CommentsController < ApplicationController
  before_filter :encontrar_usuario, :only =>[:new, :create, :edit, :update, :destroy]
    
  def new
    @coment = Comment.new
    @ticket = Ticket.find_by_id(params[:ticket_id])    
  end

  def create
    @ticket = Ticket.find_by_id(params[:ticket_id])
    @coment = @ticket.comments.new(params[:comment])
    @coment.autor = @user.name 
    @coment.user_id = session[:user_id]
    if @coment.save
      redirect_to ver_todos_url, :notice=> 'Comentario creado correctamente'
    else
      flash.now[:alert] = "No se ha podido crear el comentario"
      render "new"
    end
  end

  #def show
    #@tickets = Ticket.all.paginate(:page => params[:page], :per_page => 5)
    #redirect_to ver_todos_url    
  #end
  
  #def index
    #if params[:user_id]
   # if @user
      #@user = User.find(params[:user_id])
    #  @comentarios = @user.comentarios
    #elsif params[:ticket_id]
     #  @ticket = Ticket.find(params[:ticket_id])
      # @comentarios = @ticket.comentarios
  #  else
     # @comentarios = Ticket.all
   # end
    #render 'show'
  #end

  def edit
    @ticket = Ticket.find_by_id(params[:ticket_id])
    if @ticket.user.id == session[:user_id]
      @comentario = Comment.find_by_ticket_id(params[:ticket_id])
    else
      redirect_to  ver_todos_path, :notice =>'No puedes editar un comentario que no es tuyo !!!'
    end
  end

  def update
    if @user.id == session[:user_id]
      @comentario = Comment.find_by_ticket_id(params[:ticket_id])
      if @comentario.update_attributes(params[:comment])
        redirect_to ticket_path(@user.tickets.id), :notice => "Comentario Actualizado correctamente"
      else
        render "edit"
      end
    else
      redirect_to  ver_todos_path, :notice =>'No puedes editar un comentario que no es tuyo !!!'
    end
  end

  def destroy
    #@ticket = Ticket.find_by_id(params[:ticket_id])    
    if @user.id == @comentario.user_id
      @comentario = Comment.find_by_ticket_id(params[:ticket_id])
      @comentario.destroy
      redirect_to ver_todos_url, :notice => "Comentario eliminado correctamente"
    else
      redirect_to  ver_todos_path, :notice =>'No puedes Eliminar un comentario que no es tuyo !!!'
    end
  end

  private
  def encontrar_usuario
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash.now.alert = "Necesitas identificarte antes de poder comentar"
      redirect_to log_in_path
    end    
  end
end
