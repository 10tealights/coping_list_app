class CopingList < ApplicationRecord
  belongs_to :user

  validates :list_name, presence: true, length: { maximum: 30 }
end
