class StaticPagesController < ApplicationController
  def legalidad
    @titulo = 'Condiciones legales'
  end

  def privacidad
    @titulo = 'Privacidad'
  end
end
