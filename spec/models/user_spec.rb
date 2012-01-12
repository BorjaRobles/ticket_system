require 'spec_helper'
include Capybara::DSL

describe User do
  before do
    @admin = FactoryGirl.create(:user)
  end
    
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:tickets)}
  it { should have_many(:comments)}
end

