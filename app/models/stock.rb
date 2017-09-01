class Stock < ApplicationRecord
  has_many :quotes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
