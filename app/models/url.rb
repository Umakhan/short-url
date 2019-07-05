class Url < ApplicationRecord
  validates :short, presence: true, uniqueness: true, length: { maximum: 150 }
  validates :original, presence: true
end
