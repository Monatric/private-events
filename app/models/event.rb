class Event < ApplicationRecord
  validates :event_date, presence: true

  belongs_to :creator, class_name: "User"
end
