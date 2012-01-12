class HomeController < ApplicationController
  def index
    @titulo = "Home"
  end
  
  def sigin
    @titulo = 'Registrate'
  end
end
