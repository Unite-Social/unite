module ApplicationHelper
  def time_ago_in_words_with_now(time)
    diff_in_seconds = Time.now - time
    case diff_in_seconds
    when 0..59
      "now"
    when 60..3599
      "#{(diff_in_seconds / 60).to_i} min ago"
    else
      time_ago = time_ago_in_words(time)
      time_ago.gsub("about ", "") + " ago"
    end
  end
end
