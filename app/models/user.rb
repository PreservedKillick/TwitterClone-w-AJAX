class User < ActiveRecord::Base
  has_many :tweets

  after_create :send_welcome_message

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :password, :presence => true
  validates :handle, :presence => true, :uniqueness => true



  def send_welcome_message
    UserMailer.send_confirmation(self)
  end
end
