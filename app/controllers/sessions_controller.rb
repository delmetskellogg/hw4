class SessionsController < ApplicationController
  def new
  end

  def create
        # authenticate the user
    # @user = User.where({ email: params["email"] })[0]
    @user = User.find_by({ email: params["email"] })
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        #session[:username] = @user.username
        flash[:notice] = "Welcome, #{@user.username}."
        redirect_to "/places"
      else
        flash[:notice] = "Nope"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Nope"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end
end
  