module ApplicationHelper
  def current_user
    begin
      u = User.find(session[:current_user_id])
    rescue
      u = nil
    end
    u
  end
end
