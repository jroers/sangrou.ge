class OrganizationsController < ApplicationController
	def index
		@organizations = Organization.all
	end

	def show
		@organization = Organization.find_by_id(current_user.organization_id)
		sort_donation_types(@organization)
	end

	private

	def sort_donation_types(org)
		@Opos = []
		@Oneg = []
		@Apos = []
		@Aneg = []
		@Bpos = []
		@Bneg = []
		@ABpos = []
		@ABneg = []
		org.donations.each do |donation|
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
