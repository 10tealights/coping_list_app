class Coping < ApplicationRecord
  belongs_to :coping_list

  validates :coping_name, presence: true
  validates :emoji, presence: true
  validates :status, presence: true

  enum status: { public: 0, private: 1 }
end
