class SessionsController < ApplicationController

  def show_info
    raise request.env["omniauth.auth"].to_yaml
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to cards_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to cards_path
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
