class CommentsController < ApplicationController
  before_filter :login_required, :only=>[:new,:create,:edit,:update, :destroy]
  
    
  def new
    @comment = Comment.new
    @ticket = Ticket.find_by_id(params[:ticket_id])
    @user = User.find_by_id(params[:user_id])    
  end

  def create
    @ticket = Ticket.find_by_id(params[:ticket_id])
    @comment = @ticket.comments.new(params[:comment])
    @comment.autor = current_user.name 
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to tickets_url, :notice=> 'Comentario creado correctamente'
    else
      flash.now[:alert] = "No se ha podido crear el comentario"
      render "new"
    end
  end
  
  def edit
    @ticket = current_user.tickets.find(params[:id])
    if @ticket
      @comment = Comment.find_by_ticket_id(params[:ticket_id])
    else
      redirect_to  tickets_path, :notice =>'No puedes editar un comentario que no es tuyo !!!'
    end
  end

  def update
    @comment = current_user.comments.find_by_ticket_id(params[:ticket_id])
    if @comment.update_attributes(params[:comment])
      redirect_to ticket_path(@user.tickets.id), :notice => "Comentario Actualizado correctamente"
    else
      render "edit"
    end
  end

  def destroy 
    @comment = current_user.comments.find_by_ticket_id(params[:ticket_id])
    if @comment.destroy
      redirect_to tickets_url, :notice => "Comentario eliminado correctamente"
    else
      redirect_to  tickets_path, :notice =>'No puedes Eliminar un comentario que no es tuyo !!!'
    end
  end  
end
