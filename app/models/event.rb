class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :event_date, presence: true, comparison: { greater_than: 1.day.from_now, less_than: 1.year.from_now }

  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :invitations
  has_many :attendees, through: :attendances, source: :attendee
  has_many :invitees, through: :invitations, source: :invitee

  scope :past, -> { where("event_date < ?", DateTime.now) }
  scope :future, -> { where("event_date > ?", DateTime.now) }
end
