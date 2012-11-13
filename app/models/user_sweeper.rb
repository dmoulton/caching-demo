class UserSweeper < ActionController::Caching::Sweeper
  observe User

  def after_create(user)
    expire_cache_for(user)
  end

  def after_update(user)
    expire_cache_for(user)
  end

  def after_destroy(user)
    expire_cache_for(user)
  end

  private

  def expire_cache_for(user)
    expire_page(:controller => 'users', :action => 'index')

    expire_fragment(:action=>'index',:action_suffix => 'all_users')
  end
end