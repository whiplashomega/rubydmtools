class Character < ActiveRecord::Base
  has_many :attacks
  has_one :user
end
