require 'spec_helper'
include Capybara::DSL

describe "Comprobando la pagina principal" do  
  it "Tiene que encontrarse en '/' " do       
    visit '/'
    page.should have_css("title", :text => "Home")    
  end
  
  it "Al picar en Inicio, me redirige a inicio" do
    visit '/'
    click_on('Inicio')
    page.should have_css('title', :text=> 'Home')
  end
  
  it "Al picar en contacto tiene que redirigirme a la pagina de contacto" do
    visit '/'
    click_on('Contacto')
    page.should have_css('title', :text=> 'Contactanos')
  end  
  
  it "Al picar en Registrate...." do
    visit '/'
    click_on('Registrate')
    page.should have_css('title', :text=>'Registrate')
  end
  
  it "Al picar en Identificate va a la pagina de identificacion" do
    visit '/'
    click_on('Identificate')
    page.should have_css('title', :text=>'Identificate')
  end
  
  it "Al picar en 'Ver tickets' me lleva al indice de todos los tickets" do
    visit '/'
    click_on('Ver tickets')
    page.should have_css('title', :text=>'Listado de todos os tickets')
  end
  
  it "Al clickar en 'Buscador de tickets' me lleva a la pagina de busqueda" do
    visit '/'
    click_on('Buscador de tickets')
    page.should have_css('title', :text=>'Buscador')
  end
  
  it "Al picar en 'Condiciones legales' me lleva a la pagina de condiciones legales " do
    visit '/'
    click_on('Condiciones legales')
    page.should have_css('title', :text=>'Condiciones legales')
  end
  
  it "Al picar en 'Privacidad' me llevara a la pagina de legalidad" do
    visit '/'
    click_on('Privacidad')
    page.should have_css('title', :text=>'Privacidad')
  end 
end