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

  def avatar_for_gender(user)
     if user.gender == "m"
       (asset_path 'male_avatar.svg')
     elsif user.gender == "f"
       (asset_path 'female_avatar.svg')
     else
       (asset_path 'default-avatar.png')
     end
  end
end
