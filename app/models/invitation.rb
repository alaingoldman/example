class Invitation < ActiveRecord::Base
  attr_accessible :accepted_at, :invite_token, :email, :sent_by, :sent_to


  before_save { |invitation| invitation.email = email.downcase }
  before_create { generate_token(:invite_token) }

  belongs_to :user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }





def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Invitation.exists?(column => self[column])
end

end