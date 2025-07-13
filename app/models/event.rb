class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :event_date, presence: true

  belongs_to :creator, class_name: "User"
end
