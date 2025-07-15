module EventsHelper
  def event_joined?(user, event_id)
    user.attended_event_ids.include?(event_id)
  end

  def event_creator?(user, event_creator_id)
    user.id == event_creator_id
  end

  def event_finished?(event_id)
    p "TEST + #{Event.past}"
    Event.past.where(id: event_id).any?
  end
end
