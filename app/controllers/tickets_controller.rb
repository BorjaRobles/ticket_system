class TicketsController < ApplicationController
  before_filter :login_required, :only=>[:show,:new, :edit, :update, :create, :destroy]
  
  def buscador
    @titulo = 'Buscador'
    if params[:tag_list].blank?
      @tickets = Ticket.buscar_titulo(params[:titulo]).paginate(:page => params[:page], :per_page => 2)
    else
      @tickets = Ticket.tagged_with(params[:tag_list], :any => true).paginate(:page => params[:page], :per_page => 2)
    end
  end
  
  def index
    @titulo ='Listado de todos los tickets'
    @comment = Comment.new
    
    if (params[:busqueda]==Ticket::FILTRO)
      if (params[:estado]==Ticket::TODOS)
        @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 5)
      else      
        @tickets = Ticket.where(:estado => params[:estado]).paginate(:page => params[:page], :per_page => 5)
      end
    else
      @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 5)
      if params[:estado]
        @ticket = Ticket.find(params[:ticket_id])
        @ticket.asignar_estado(params[:estado], current_user.name)
        redirect_to tickets_path
      end
    end
  end
      
  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(params[:ticket])
    if @ticket.save
      redirect_to ticket_path(@ticket.id), :notice => "Ticket creado correctamente"
    else
      render "new"
    end
  end

  def edit
    @ticket = current_user.tickets.find(params[:user_id])
  end

  def update
    @ticket = current_user.tickets.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to ticket_path(@ticket.id), :notice => "Ticket Actualizado correctamente"
    else
      render "edit"
    end
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    if @ticket
      @ticket.destroy
      redirect_to tickets_url, :notice => "Ticket eliminado"
    else
      redirect_to tickets_url, :notice => "No tienes permiso para eliminar el ticket"
    end  
  end
end

