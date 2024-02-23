module RecordsHelper
  def time_difference_string_for_record(record)
    created_at = record.created_at
    time_difference = Time.current - created_at

    days = (time_difference / 1.day).to_i
    hours = ((time_difference % 1.day) / 1.hour).to_i
    minutes = ((time_difference % 1.hour) / 1.minute).to_i

    time_ago = []
    time_ago << pluralize(days, 'day') if days > 0
    time_ago << pluralize(hours, 'hour') if hours > 0
    time_ago << pluralize(minutes, 'minute') if minutes > 0

    time_ago.any? ? time_ago.join(" ") + " ago" : "just now"
  end
end