class Customer < ApplicationRecord
  has_many :orders

  validates :address, presence: true
end
