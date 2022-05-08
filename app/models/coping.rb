class Coping < ApplicationRecord
  belongs_to :coping_list

  validates :coping_name, presence: true
  validates :emoji, presence: true
  validates :status, presence: true

  enum status: { open: 0, close: 1 }
end
