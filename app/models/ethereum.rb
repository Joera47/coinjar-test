class Ethereum < ApplicationRecord
  validates :ask,  presence: true
  validates :bid,  presence: true
  validates :last, presence: true
end