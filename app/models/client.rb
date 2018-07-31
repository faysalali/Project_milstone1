class Client < ApplicationRecord
  validates :name, :email, presence: true, length: { minimum: 3 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  def country_name
    ISO3166::Country[country]
  end
end
