class Currency < ApplicationRecord
  has_many :payees
  has_many :payouts

  validates :code, presence: true, uniqueness: {case_sensitive: false}
end
