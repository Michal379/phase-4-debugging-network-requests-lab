class Toy < ApplicationRecord
    validates :name, presence: true
    validates :image, presence: true
    validates :likes, numericality: { only_integer: true }
  
    attribute :likes, :integer, default: 0
  end