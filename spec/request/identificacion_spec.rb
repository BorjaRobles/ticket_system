require 'spec_helper'
include Capybara::DSL

describe "Comprobando la pagina identificacion" do
  
  before do
    @user = FactoryGirl.create(:user)
  end
 
  it "Tiene que encontrarse en '/log_in' " do
    visit '/log_in'
    page.should have_css("title", :text => "Identificate")
    fill_in 'email', :with=> @user.email
    fill_in 'password', :with=> @user.password
    click_on "Log in"
  end 
end