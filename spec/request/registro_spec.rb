require 'spec_helper'
include Capybara::DSL

describe "Comprobando la pagina Registrate" do
    
  it "Tiene que encontrarse en '/sign up' " do       
    visit '/sign_up'
    page.should have_css("title", :text => "Registrate")        
  end
  
  it "Rellenando los campos" do
    visit '/sign_up'
    page.should have_css("title", :text => "Registrate")
    fill_in "user_username", :with=> 'Perico1'
    fill_in "user_name", :with=> 'Palotes'
    fill_in "user_email", :with=> 'noexisto123@example.com'
    fill_in "user_password", :with=> 'elpassword123'
    fill_in "user_password_confirmation", :with=> 'elpassword123'
    click_on "Enviar"
  end
end