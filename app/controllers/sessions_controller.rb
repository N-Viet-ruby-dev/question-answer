class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      log_in user
      func_two
      func_one
    else
      func_three
    end
  end

  def func_one
    if user.admin?
      redirect_to admin_path
    else
      redirect_back_or user
    end
  end

  def func_two
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end

  def func_three
    flash.now[:danger] = "Invalid email or password combination"
    render "new"
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
