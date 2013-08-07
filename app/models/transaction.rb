class Transaction < ActiveRecord::Base
  attr_accessible :buyer_id, :credit_uri, :debit_uri, :price, :product_id, :seller_id, :ship_method, :ship_price
  require 'balanced'  
  attr_reader :errors


  # def initialize(email, amount, credit_card_hash)
  #   @email = email
  #   @amount = (amount * 100).to_i
  #   @credit_card_hash = credit_card_hash
  #   @buyer = nil
  #   @card = nil
  #   @errors = []
  # end

  # def charge
  #   begin
  #     create_card
  #     find_or_create_buyer
  #     debit_buyer
  #     credit_owner
  #     return true
  #   rescue
  #     return false
  #   end
  # end

  # private

  #   def create_card
  #       begin
  #           @card = Balanced::Card.new(@credit_card_hash).save 
  #       rescue
  #           @errors << 'Your credit card is invalid'
  #       end
  #   end

  #   def find_or_create_buyer
  #       begin
  #           buyer = Balanced::Account.find_by_email(@email)
  #           if buyer.present?
  #               @buyer = buyer
  #        else
  #               @buyer = Balanced::Marketplace.my_marketplace.create_buyer(@email, @card.uri)
  #        end
  #       rescue
  #           @errors << 'Your account is invalid'
  #       end
  #   end

  #   def debit_buyer
  #       begin
  #           payment = @buyer.debit(@amount, "Everkitten.com")
  #       rescue
  #           @errors << 'Your credit card could not be charged'
  #       end
  #   end

  #   def credit_owner
  #     begin
  #       Balanced::Marketplace.my_marketplace.owner_account.credit(amount)
  #     rescue
  #       @errors << 'Your credit card payment did not go through.'
  #     end
  #   end

end
