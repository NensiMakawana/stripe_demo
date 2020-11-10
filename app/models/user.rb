class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def save_with_payment
      if valid?
        customer = Stripe::Customer.create(email: email, card: card_token)
        Stripe::Charge.create(
          customer: customer.id, amount: 50, description: 'TEst', currency: 'usd'
        )
      end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "#{e.message}"
      false
    end
end
