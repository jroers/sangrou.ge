class DonationsController < ApplicationController

	before_action :logged_in?, except: []

	def index
		@donations = Donation.all
	end

	def new
		@donation = Donation.new
		@donor = User.find_by_id(params[:donor_id])
		@tech = User.find_by_id(session[:user_id])
	end

	def create
		@donation = Donation.new(donation_params)
		if @donation.save
			redirect_to profile_path
			flash[:success] = "Donation complete"
		else
			redirect_to new_donation_path(params[:donation][:user_id])
			flash[:error] = "Data validation error"
		end
	end

	private

	def donation_params
		params.require(:donation).permit(:abo, :rhb, :heart_rate, :bp, :hemoglobin, :user_id, :tech_id, :organization_id)
	end

end
