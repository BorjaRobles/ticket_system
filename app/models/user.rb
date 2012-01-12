class User < ActiveRecord::Base    
  has_many :tickets, :dependent=> :destroy
  has_many :comments, :dependent=> :destroy

  has_attached_file :foto, :styles => { :small => "50x50>" }
         
  attr_accessible :email, :password, :password_confirmation, :username, :name, :foto, :soporte   
  attr_accessor :password
   
  before_save :encrypt_password
      
  validates :name,      :presence => true,
                        :uniqueness => true,
                        :format =>{:with => RubyRegex::Username}
  validates :username,  :presence => true,
                        :uniqueness => true
  validates :password,  :presence => true,
                        :confirmation => true,
                        :on=> :create
  validates :email,     :presence => true,
                        :uniqueness => true,
                        :format => {:with => RubyRegex::Email }
  
  def self.authenticate(email, password)
    if password.blank? || email.blank?
      nil
    else  
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
        user
      else
        nil
      end
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end