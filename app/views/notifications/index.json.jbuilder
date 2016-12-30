json.array! @notifications do |notification|
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do
    json.type notification.notifiable.class.to_s.underscore.humanize.downcase
  end
  json.url post_path(notification.notifiable)
end
