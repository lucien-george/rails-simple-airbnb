class Flat < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
  validates :number_of_guests, presence: true, inclusion: { in: (0..10) }, numericality: { only_integer: true }
  validates :picture, presence: true
end
