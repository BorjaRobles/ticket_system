require 'spec_helper'
include Capybara::DSL

describe Comment do
  before do
    @comentario = FactoryGirl.create(:comment)
  end
  
  it { should belong_to(:ticket)}
  it { should belong_to(:user)}
  it { should validate_presence_of(:texto)}
end


