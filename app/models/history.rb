class History < ApplicationRecord
  belongs_to :coping

  validates :change_amount, presence: true, numericality: { greater_than_or_equal_to: -100, less_than_or_equal_to: 100 }
  validates :evaluation, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end