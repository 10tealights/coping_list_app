class Coping < ApplicationRecord
  belongs_to :coping_list
  has_many :histories, dependent: :destroy

  validates :coping_name, presence: true
  validates :emoji, presence: true, format: { with: /[\p{Emoji}\p{Emoji_Component}&&[:^ascii:]]/, message: "のみ使えます(※一部使用できないものがあります)" }, length: { maximum: 3 }
  validates :status, presence: true

  enum status: { open: 0, close: 1 }

  scope :high_avarage_rate, ->(coping_list) { joins(:histories).where(coping_list_id: coping_list.id).group(:id).limit(5).order('average_evaluation desc').average(:evaluation) }
  scope :no_histories, -> { left_joins(:histories).where(histories: { id: nil }).sample(5) }
end
