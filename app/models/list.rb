class List < ApplicationRecord
validates :title, presence: true
validates :start, presence: true
validates :end, presence: true
validate :start_end_check

  def start_end_check
    if start.present? && self.end.present? && start > self.end
      errors.add(:end, "は開始日より後の日付に設定してください")
    end
  end

  validates :title,
    length: { minimum: 1, maximum: 20 }

  validates :memo,
    length: { maximum: 500 }


end
