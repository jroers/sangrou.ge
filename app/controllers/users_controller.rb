class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = current_user
	end

	def new_tech
		@organization = Organization.find_by_id(params[:organization_id])
		@user = User.new
	end

	def new_donor
		@user = User.new
	end

	def create_tech
		if domain_matches?
			@user = User.new(tech_params.merge(email: params[:user][:email].downcase ,is_tech?: true))
			if @user.save
				redirect_to profile_path
			else
				redirect_to tech_signup_path(params[:user][:organization][:id])
				flash[:error] = "Please ensure all fields are entered correctly"
			end
		end
	end

	private

	def tech_params
		params.require(:user).permit(:first, :last, :password)
	end

	def domain_matches?
		user_email = params[:user][:email].downcase
		expected_domain = params[:user][:organization_domain]
		if user_email[-1 * expected_domain.length, expected_domain.length] == expected_domain
			return true
		else
			redirect_to tech_signup_path(params[:user][:organization_id])
			flash[:error] = "Please enter a valid email address for this organization."
			return false
		end
	end
end
