class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end

# A restaurant must have at least a name and an address.
# The restaurant category should belong to a fixed list ["chinese", "italian", "japanese", "french", "belgian"].
