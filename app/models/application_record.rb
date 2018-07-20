class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum role: [:user, :admin, :maneger]
  enum status: [:disable, :enable]
end
