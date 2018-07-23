class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
  def active_for_authentication? 
    super && enable? 
  end 
  
  def inactive_message 
    if enable? 
       super 
    else 
      :not_approved 
    end 
  end
