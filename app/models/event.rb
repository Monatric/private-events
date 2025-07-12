class Event < ApplicationRecord
  validates :event_date, presence: true
end
