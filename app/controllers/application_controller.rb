class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def must_login
  	unless logged_in?
  		redirect_to '/users/index'
  	end
  end
end
