class OrganizationsController < ApplicationController
	# TODO: Build more robust helper method to check if tech
	# If not, then the page should reload to the profile_path
	# before_action :tech?, except: [:index]

	def index
		@organizations = Organization.all
	end

	def org_dashboard
		if tech?
			@organization = Organization.find_by_id(current_user.organization_id)
			sort_donation_types(@organization.donations)
		else
			redirect_to profile_path
		end
	end

	def my_sticks_dashboard
		if tech?
			@donations = Donation.where(tech_id: current_user.id)
			sort_donation_types(@donations)
		else
			redirect_to profile_path
		end
	end

	private

	def sort_donation_types(donations)
		@Opos = []
		@Oneg = []
		@Apos = []
		@Aneg = []
		@Bpos = []
		@Bneg = []
		@ABpos = []
		@ABneg = []
		donations.each do |donation|
			if donation.abo.upcase == "O"
				if donation.rhb == "+"
					@Opos << donation
				elsif donation.rhb == "-"
					@Oneg << donation
				end
			elsif donation.abo.upcase == "A"
				if donation.rhb == "+"
					@Apos << donation
				elsif donation.rhb == "-"
					@Aneg << donation
				end
			elsif donation.abo.upcase == "B"
				if donation.rhb == "+"
					@Bpos << donation
				elsif donation.rhb == "-"
					@Bneg << donation
				end
			elsif donation.abo.upcase == "AB"
				if donation.rhb == "+"
					@ABpos << donation
				elsif donation.rhb == "-"
					@ABneg << donation
				end
			end
		end
	end

end
