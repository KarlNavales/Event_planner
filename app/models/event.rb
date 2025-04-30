class Event < ApplicationRecord
  belongs_to :user
  has_many :rsvps
  has_many :attendees, through: :rsvps, source: :user

  validates :title, :start_time, :location, presence: true
  validate :end_time_after_start_time

  scope :upcoming, -> { where("start_time > ?", Time.now).order(:start_time) }
  scope :past, -> { where("start_time <= ?", Time.now).order(start_time: :desc) }

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after start time")
    end
  end
end
