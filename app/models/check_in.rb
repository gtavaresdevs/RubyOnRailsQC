class CheckIn < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 280 }

  validate :one_check_in_per_day

  private

  def one_check_in_per_day
    return if user.blank? || content.blank?

    today = Time.zone.today
    existing = CheckIn.where(user: user)
                      .where(created_at: today.beginning_of_day..today.end_of_day)
    existing = existing.where.not(id: id) if persisted?

    if existing.exists?
      errors.add(:base, "You already checked in today.")
    end
  end
end
