class LoginController < ApplicationController
  skip_before_filter :authenticate
  skip_before_filter :authorize

  #layout 'login_layout'

  def login
    if logged_in?
      redirect_to default_page and return
    end

    user = nil

    if request.post?
      @login = params[:login]
      user = User.authenticate(@login[:username], User.hash_password(@login[:username], @login[:password]))
      if user
        if user.enabled?
          User.current_user = user
          session[:user_id] = user.id
          session[:user_name] = 'Guest'
          if session[:original_uri].nil? || session[:original_uri] =~ /login/
              redirect_to default_page and return
          else
            redirect_to session[:original_uri]
            session[:original_uri] = nil
            return
          end
        end
      end

      session[:user_id] = nil
      session[:user_name] = nil
      flash[:error] = 'Username and Password do not match'
      message = 'Username and Password do not match'
      redirect_to :controller => :gm65, :action => :signin, :params => { :message => message } and return
    end
  end

  def logout
    User.current_user = nil
    session[:user_id] = nil
    session[:user_name] = nil
    reset_session
    message = 'You are now signed out.'
    redirect_to :controller => :gm65, :action => :signin, :params => { :message => message } and return
  end

end
