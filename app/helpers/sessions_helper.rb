module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in
    !current_user.nil?
  end

  def is_admin
    logged_in && current_user.admin
  end

  def require_login
    not_found unless logged_in
  end

  def allow_only_admin
    not_found unless is_admin
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
