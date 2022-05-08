class CopingList < ApplicationRecord
  belongs_to :user
  has_many :copings, dependent: :destroy

  validates :list_name, presence: true, length: { maximum: 30 }
end
