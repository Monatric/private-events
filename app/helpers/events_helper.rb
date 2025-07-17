module EventsHelper
  def event_joined?(user, event)
    user.attended_event_ids.include?(event.id)
  end

  def event_creator?(user, event)
    user.id == event.creator_id
  end

  def invited?(event, invitee)
    event.invitees.include?(invitee)
  end
end
