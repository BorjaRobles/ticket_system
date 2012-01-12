module ApplicationHelper
  def titulo
    titulo_base = "Sistema de tickets"
    if @titulo.nil?
      titulo_base
    else
      "#{titulo_base} - #{@titulo}"
    end
  end  
end
