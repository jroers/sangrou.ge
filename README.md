## SANGROU.GE

A web-based blood donation system!

### What's the problem with the current solutions?
Many organizations have programs that are specific to their own practices. Donors have multiple accounts to essentially do the same thing.

By having a single database, donors don't have to spend more time filling out paperwork. That's one less excuse for not donating!

By creating a web application that is accessible from a mobile device, blood drive setup can be less intensive - the whole process taking place on a cell phone or tablet over laptops.

##Model Structure

* Organization

	* An Organization has_many Donations
	* An Organization has_many Users through Donations

* Donation	

	* A Donation belongs_to a User
	* A Donation belongs_to an Organization

* User
	* A User has_many Donations
	* A User has_many Organizations through Donations

#Sprint 1 - MVP
- [x] Setup user auth.
- [x] Splash page should be a login screen with a button to sign up. - Signup button not needed.
- [x] Login as a user to view new donation splash page
- [x] Utiilize a form to create a new user as a donor
- [x] Once a collection has been completed, the tech can save the blood product
- [x] In the database, the organization where the donation was collected is connected to the donation

#Sprit 2

- [x] A donor can log into their own profile and see a list of all of their donations
- [ ] A user can select an individual donation to view further details about it
- [x] A Tech can indicate the organization they work for
- [ ] A donor can create their own account and enter contact information

#Sprint 3
- [ ] Allow Hospital admins to log into a hospital management page
- [ ] Account for blood product codes that are performed at certain hospitals.
- [ ] Enable Paperclip to save hospital logo

##Some code!

####Data validation!

	with_options if: :is_tech? do |tech|
  		tech.validates :first, :last, :email, :password, :is_tech?, presence: true
  		tech.validates :password, length: {in: 4..12, message: "must be between 4 and 12 characters"}
  		tech.validates :email, uniqueness: true, format: { with: /@/ }, length: { minimum: 6, message: "must have valid email structure" }
  	end
  	with_options unless: :is_tech? do |donor|
  		donor.validates :first, :last, :email, :phone, :dob, :address1, :city, :state, :zip, presence: true
  		donor.validates :phone, format: { with: /\d{10}/, message: "must be in the format '##########'"}
  		donor.validates :password, presence: true,
  			length: {in: 4..12, message: "must be between 4 and 12 characters"},
  			on: :create
  		donor.validates :email, uniqueness: true, format: { with: /@/ }, length: { minimum: 6, message: "must have valid email structure" }
  	end

Since I have two types of users, I have different kinds of form validation for them. Techs don't need to provide contact information, since they're affiliated through the organization.

Donors should provide contact information to follow-up as needed regarding their donations.

####Some more validation - Tech signup
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

Techs need to sign up with a valid email for a particular organization. If the email they're using to sign up does not match the email domain specified for that particular organization, signup will fail.

####Blood Sorting
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

For the purposes of reporting, I created a dashboard that displays cards for each blood type along with the amount of that product that the organization (or tech) has collected. This private method sorts the donations to be displayed on donation dashboards.

I'd also like to use this to display graphs of the number of units collected over time.

##Towards the Future

* Prevent signing out during a donation
* Allow donors to update their own information (except name and dob)
* Validate email addresses by sending out confirmation email!
* Add checks for allowed vitals (e.g. Hemoglobin > 12.5 for women, 13.0 for men).
* Prevent donors from donating products too soon
* Visualize total donations collected with [ChartKick](http://chartkick.com/)
* Create hospital management page
  * Hospitals can follow up with donors to thank them for their donations
  * Hospitals can view table of their previous donors and when they last donated at any center - follow up for future donations
  * - Modify model structure to allow Organizations to hold individual blood drives (Organization has_many Drives)
* Add form for donors to update contact information/login credentials.
* Build out FDA's questionnaire
* List out blood product codes that can be performed at a hospital

####Super stretch goals:
* Generate blood product barcodes to be printed out for bags.
* Schedule donors for donation appointments.

##Try it out!
1. Clone this repo!
2. Run `bundle install`, `rake db:create`, `rake db:migrate`, `rake db:seed`, then `rails s`
3. Try logging in with one of the seed techs: **email:** ga.phleb1@gablood.co, **password:** 1234
4. Search for an existing donor by id or email (**seed ids**: 3, 4 | **seed emails**: first.donor@ga.co, second.donor@ga.co)  
5. ...Or create a new donor!
6. Fill out the vitals form and save the donation
7. Go to `Dashboards` and select either the Organization or My Sticks dashboard.
8. Log out and log in as a donor (**seed emails**: first.donor@ga.co, second.donor@ga.co, **passwords**: 1234)
