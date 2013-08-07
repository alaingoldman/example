class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :condition, :ship_method, :ship_price, :quantity, :photo, :photos_attributes
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  include Rails.application.routes.url_helpers

  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length:  { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 3.00 }
  validates :description, presence: true, length:  { minimum: 5 }
  validates :condition, presence: true
  validates :ship_method, presence: true
  validates :ship_price, presence: true
  # validates :quantity, presence: true
  # validates :photos, presence: true



    def price=(price_str)
    write_attribute(:price, price_str.sub("$ ", ""))
    end

    def ship_price=(ship_price_str)
    write_attribute(:ship_price, ship_price_str.sub("$ ", ""))
    end

end


