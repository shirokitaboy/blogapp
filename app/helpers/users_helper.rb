module UsersHelper
  def after_action
    if logged_in?
      redirect_to blogs_path
    else
      redirect_to new_session_path
    end
  end
end
