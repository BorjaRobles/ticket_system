require 'spec_helper'
include Capybara::DSL

describe Ticket do
  before do
    @ticket = FactoryGirl.create(:ticket)
  end
  
  it { should belong_to(:user)}
  it { should have_many(:comments)}
  it { should validate_presence_of(:titulo)}
  it { should validate_presence_of(:contenido)}
  it { should ensure_length_of(:contenido).is_at_least(5)}
end