class SessionController < ApplicationController
  skip_before_filter :authenticate!

  def create
    user = User.where(:username=>params[:username],:password=>params[:password]).first

    session[:current_user_id] = user.id unless user.nil?

    redirect_to users_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to home_index_path
  end
end
