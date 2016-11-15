module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end
  def active_tab
    if controller? :posts
      " active"
    elsif controller? :documents
      " active"
    else
      ""
    end
  end
end
