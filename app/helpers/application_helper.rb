module ApplicationHelper
  def navbar_menu
    render "layouts/#{navbar_menu_view}"
  end

  private
  def navbar_menu_view
    if user_signed_in?
      "user_navbar_menu"
    elsif admin_signed_in?
      "admin_navbar_menu"
    else
      "navbar_menu"
    end
  end

end
