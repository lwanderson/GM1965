# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :logged_in?, :current_configuration, :default_page
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  self.allow_forgery_protection = false

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, "Password"

  #layout 'dashboard_layout'

  before_filter :clear_current_user
  before_filter :authenticate, :except => ['registrations/create','index','gm65index','register','reg_error','member_randr','signin','memoriam','login']
  before_filter :authorize, :except => ['registrations/create','index','gm65index','register','reg_error','member_randr','signin','memoriam','login']

  def default_page
    if logged_in?
      if User.current_user.admin?
        url_for(:controller => :dashboard, :action => :index)
      else
        url_for(:controller => :gm65, :action => :gm65index)
      end
    else
      url_for(:controller => :gm65, :action => :signin)
    end
  end

  def current_configuration
    User.configurations[RAILS_ENV]
  end

  def rescue_action(exception)
    @error = Error.new(self, exception)
    super(exception)
  end

  private

  def clear_current_user
    User.current_user = nil
    # session[:user_id] = nil
  end

  #This ensures that every request from remoting will first hit the authentication action.
  #This is pretty much a brick wall if you don't return true from the filter.
  # success = User.authenticate(...)
  # authenticate(...) should set User.current_user if login is successful
  # return success (or User.!current_user.nil?)
  def authenticate
    if !logged_in?
      session[:original_uri] = request.request_uri
      flash[:notice] = 'Please log in'
      redirect_to default_page
      return false
    end
  end

  def authorize
    authorized = true
    roles = []

    begin
      roles = (self.class::ROLES_FOR_ACTION[action_name.to_sym].to_a || [])
    rescue
      roles = []
    end

    # Roles will be empty for unrestricted actions
    unless roles.empty?
      authorized = User.current_user.has_any_roles?(roles)
    end

    unless authorized
      flash[:error] = "You are not authorized to perform the requested action."
      redirect_to default_page
      return false
    end

    authorized
  end

  def logged_in?
    if User.current_user.nil?
      unless session[:user_id].nil?
        begin
          User.current_user = User.find session[:user_id]
        rescue
          session[:user_id] = nil
          return false
        end
      end
    end

    !User.current_user.nil?
  end


end
