module ApplicationHelper
  def active(current)
    if controller_name == "posts" and current == "posts"
      " active-sidenav"
    elsif controller_name == "documents" and current == "documents"
      " active-sidenav"
    else
      ""
    end
  end
end
