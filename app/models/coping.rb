class Coping < ApplicationRecord
  belongs_to :coping_list
  has_many :histories, dependent: :destroy

  validates :coping_name, presence: true
  validates :emoji, presence: true
  validates :status, presence: true

  enum status: { open: 0, close: 1 }
end
