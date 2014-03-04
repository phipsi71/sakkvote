class ApplicationController < ActionController::Base
  before_filter :set_session
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected
    def authenticate
    #  authenticate_or_request_with_http_basic do |username, password|
    #     username == USER_ID && password == PASSWORD
    #  end
    end



  private
 
  def set_session
    session[:current_user_id] ||= SecureRandom.hex
  end

end
