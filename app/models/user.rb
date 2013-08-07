    class User < ActiveRecord::Base
      attr_accessible :email, :password, :password_confirmation, :name, :image, :photo
      
      attr_accessor :password
      before_save :encrypt_password
      before_save { |user| user.email = email.downcase }
      before_save { |user| user.name = name.downcase }
      before_create { generate_token(:auth_token) }
      before_create { generate_token(:email_token) }

      has_many :products, dependent: :destroy
      has_many :invitations
      has_many :photos,:through=>:products
      accepts_nested_attributes_for :products

      VALID_NAME_REGEX = /[a-zA-Z][a-zA-Z0-9]*/
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      VALID_PASSWORD_REGEX = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/
      validates_confirmation_of :password
      validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
      validates :password, presence: true, format:{  with: VALID_PASSWORD_REGEX }, if: proc{ password_salt.blank? || password_hash.blank? } 
      validates :name, presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: { case_sensitive: false }, length:  { minimum: 4 }

  def self.authenticate(email, password)
   user = find_by_email(email)
   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
   else  
    nil
  end
end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

end