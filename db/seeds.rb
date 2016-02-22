org = Organization.create(
	name:"GA Blood Center SF", 
	email_domain: "@gablood.co", 
	logo:"http://washingtontechnology.org/wp-content/uploads/2014/11/General_Assembly_logo.png", 
	address1:"225 Bush St.", 
	address2:"5th Floor", 
	city:"San Francisco", 
	state:"CA", 
	zip:94104
)

tech = User.create(
	first: "IP",
	last: "Phleb",
	email: "ip.phleb1@gablood.co",
	is_tech?: true,
	password: "1234"
)

donor = User.create(
	first: "Example",
	last: "Donor",
	phone: "4155555555",
	dob: "1990-01-01",
	address1: "225 Bush St",
	address2: "5th Floor",
	city: "San Francisco",
	state: "CA",
	zip: 94104,
	email: "first.donor@ga.co",
	password: "1234"
)