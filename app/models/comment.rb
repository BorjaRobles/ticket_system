class Comment < ActiveRecord::Base
  belongs_to :ticket, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  validates :texto, :presence => true
end
