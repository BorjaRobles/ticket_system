require 'spec_helper'
include Capybara::DSL

describe "Comprobando la pagina de contacto" do
    
  it "Tiene que encontrarse en '/contact_form' " do       
    visit '/contact_form'
    page.should have_css("title", :text => "Contactanos")        
  end
  
  it "Enviado los datos" do
    visit '/contact_form'
    page.should have_css("title", :text => "Contactanos")
    fill_in "Nombre", :with=> 'Perico de los palotes'
    fill_in "Email", :with=> 'noexisto@example.com'
    fill_in "Mensaje", :with=> 'Esto es un mensaje de prueba y bla bla bla bla bla :)'
    click_on "Enviar email"
  end
end