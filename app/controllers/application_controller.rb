class ApplicationController < ActionController::Base
  before_filter :authenticate!
  protect_from_forgery

  private

  def authenticate!
    begin
      @current_user = User.find(session[:current_user_id])
    rescue
      redirect_to home_index_path, :alert=>"Unauthorized"
    end
  end
end
