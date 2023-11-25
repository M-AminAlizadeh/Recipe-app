class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def value
    food.unit_price * quantity
  end

  validates :quantity, numericality: { greater_than: 0 }
end
