class TicketsController < ApplicationController
  #before_filter :encontrar_usuario, :except =>[:todos, :uno, :buscador]
  before_filter :encontrar_usuario, :only =>[:buscador, :index, :new, :create, :edit, :update, :destroy, :show]
  
  def buscador
    @titulo = 'Buscador'
   # if session[:user_id] 
    #  @user = User.find(session[:user_id])
    #end
    if params[:tag_list].blank?
      @tickets = Ticket.buscar_titulo(params[:titulo]).paginate(:page => params[:page], :per_page => 2)
    else
      @tickets = Ticket.tagged_with(params[:tag_list], :any => true).paginate(:page => params[:page], :per_page => 2)
    end
  end
  
  def index
    @titulo ='Listado de todos os tickets'
    #@user= current_user
    @coment = Comment.new
    
    if (params[:busqueda]==Ticket::FILTRO)
      #if session[:user_id] 
       # @user = User.find(session[:user_id])
      #end
      if (params[:estado]==Ticket::TODOS)
        @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 5)
      else      
        @tickets = Ticket.where(:estado => params[:estado]).paginate(:page => params[:page], :per_page => 5)
      end
    else
      @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 5)
      #if session[:user_id] 
       # @user = User.find(session[:user_id])
      #end
      if params[:estado]
        @ticket = Ticket.find(params[:ticket_id])
        @ticket.asignar_estado(params[:estado], @user.name)
        redirect_to tickets_path
      end
    end
  end
      
  def show
    if @user
        @ticket = Ticket.find(params[:id])
        #redirect_to ver_todos_url if @elticket.nil?
    else
      redirect_to tickets_url, :alert=>'Registrate antes!!'
    end
  end

  def new
    #if session[:user_id]
    if @user
      @ticket = @user.tickets.new
    else
      flash.now.alert = "Necesitas identificarte antes de crear nuevos tickets !"
      redirect_to log_in_path
    end
  end

  def create
    @ticket = @user.tickets.new(params[:ticket])
    if @ticket.save
      redirect_to ticket_path(@ticket.id), :notice => "Ticket creado correctamente"
    else
      render "new"
    end
  end

  def edit
    @ticket = @user.tickets.find(params[:user_id])
  end

  def update
    @ticket = @user.tickets.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to ticket_path(@ticket.id), :notice => "Ticket Actualizado correctamente"
    else
      render "edit"
    end
  end

  def destroy
    #@ticket = current_user.tickets.find(params[:id])
    @ticket = @user.tickets.find(params[:id])
    if @ticket
      @ticket.destroy
      redirect_to tickets_url, :notice => "Ticket eliminado"
    else
      redirect_to tickets_url, :notice => "No tienes permiso para eliminar el ticket"
    end  
  end

  private
    def encontrar_usuario
       if session[:user_id]
          @user = User.find(session[:user_id])
       end
      #if params[:user_id]
       # @user = User.find(params[:user_id])
      #end
    end
end

