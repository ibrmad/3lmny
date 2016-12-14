module ApplicationHelper
  def active(current)
    if controller_name == "posts" and current == "posts"
      " active-nav"
    elsif controller_name == "documents" and current == "documents"
      " active-nav"
    elsif controller_name == "videos" and current == "videos"
      " active-nav"
    elsif controller_name == "announcements" and current == "announcements"
      " active-nav"
    elsif controller_name == "courses" and current == "courses"
      " active-nav"
    else
      ""
    end
  end
end
