class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to profile_path
    else
      redirect_to login_path
      flash[:error] = "Looks like something went wrong."
    end
  end

  def destroy
  	logout
  	redirect_to root_path
  end
end
