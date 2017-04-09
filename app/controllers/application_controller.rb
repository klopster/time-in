class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #check_authorization for all pages
  #skip_authorization_check skip not authorized page
  
   def access_denied(exception)
    redirect_to timein_dashboard_path, alert: exception.message
  end
  
  
end
