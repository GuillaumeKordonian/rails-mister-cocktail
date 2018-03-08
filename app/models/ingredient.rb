class Ingredient < ApplicationRecord
  has_and_belongs_to_many :doses
  has_many :cocktails, through: :doses
  validates :name, uniqueness: true, presence: true
end
