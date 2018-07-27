class Client < ApplicationRecord
  validates :name, :email, presence: true, length: { minimum: 3 }
  
  def country_name
    ISO3166::Country[country]
  end
end
