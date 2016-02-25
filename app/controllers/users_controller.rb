class UsersController < ApplicationController

	before_action :logged_in?, except: [:new_tech, :create]

	def index
		@donors = User.where(is_tech?: false)
		@techs = User.where(is_tech?: true)
		if params[:search]
			donor_id_or_email?
			if @user
				redirect_to edit_donor_path(@user.id)
			else
				redirect_to profile_path
				flash[:error] = "Donor not found"
			end
		end
	end

	def show
		if tech?
			@user = current_user
			@donor = User.new
		else
			@donor = current_user
			render :donor_profile
		end
	end

	def new_tech
		if current_user
			redirect_to profile_path
		else
			@organization = Organization.find_by_id(params[:organization_id])
			@user = User.new
		end
	end

	def new_donor
		@user = User.new
	end

	def create
		if current_user
			@user = User.new(new_donor_params.merge(email: params[:user][:email].downcase))
			if @user.save
				# TODO: UPDATE TE FOLLOWING PATH ONCE DONATION PROCESS IS BETTER DEFINED
				redirect_to new_donation_path(@user.id)
			else
				redirect_to donor_signup_path
				flash[:error] = @user.errors.full_messages.join(", ")
			end
		else
			if domain_matches? && params[:user][:organization_id]
				@user = User.new(tech_params.merge(email: params[:user][:email].downcase ,is_tech?: true))
				if @user.save
					login(@user)
					redirect_to profile_path
				else
					redirect_to tech_signup_path(params[:user][:organization_id])
					flash[:error] = @user.errors.full_messages.join(", ")
				end
			end
		end
	end

	def edit_donor
		@donor = User.find_by_id(params[:id])
	end

	def update_donor
		@donor = User.find_by_id(params[:id])
		if @donor.update_attributes(update_donor_params.merge(email: params[:user][:email].downcase))
			redirect_to new_donation_path(@donor.id)
		else
			flash[:error] = @donor.errors.full_messages.join(", ")
			redirect_to edit_donor_path(@donor)
		end
	end

	private

	def tech_params
		params.require(:user).permit(:first, :last, :password, :organization_id)
	end

	def new_donor_params
		params.require(:user).permit(:first, :last, :phone, :dob, :address1, :address2, :city, :state, :zip, :password)
	end

	def update_donor_params
		params.require(:user).permit(:first, :last, :phone, :dob, :address1, :address2, :city, :state, :zip)
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

	def donor_id_or_email?
		if params[:search].to_i > 0
			@user = User.find_by(id: params[:search], is_tech?: nil)
		else
			@user = User.find_by(email: params[:search].downcase, is_tech?: nil)
		end
	end
end
