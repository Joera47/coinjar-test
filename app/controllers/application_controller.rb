class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_timezone

  def set_timezone
    if cookies[:timezone].nil?
      cookies[:timezone_cookie_check] = true
      Time.zone = "Australia/Melbourne"
    else
      cookies.delete :timezone_cookie_check if cookies[:timezone_cookie_check]

      begin
        Time.zone = cookies[:timezone] || "Australia/Melbourne"
      rescue
        Time.zone = "Australia/Melbourne"
      end
    end
  end
end
