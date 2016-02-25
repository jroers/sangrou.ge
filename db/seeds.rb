Donation.destroy_all
User.destroy_all
Organization.destroy_all

org1 = Organization.create(
	name:"GA Blood Center SF", 
	email_domain: "@gablood.co", 
	logo:"http://washingtontechnology.org/wp-content/uploads/2014/11/General_Assembly_logo.png", 
	address1:"225 Bush St.", 
	address2:"5th Floor", 
	city:"San Francisco", 
	state:"CA", 
	zip:94104
)

1tech1 = User.create(
	first: "GA",
	last: "Phleb",
	email: "ga.phleb1@gablood.co",
	is_tech?: true,
	password: "1234",
	organization_id: org1.id
)

1tech2 = User.create(
	first: "GA",
	last: "Stabber",
	email: "ga.phleb2@gablood.co",
	is_tech?: true,
	password: "1234",
	organization_id: org1.id
)

donor1 = User.create(
	first: "First",
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

donor2 = User.create(
	first: "Second",
	last: "Donor",
	phone: "4157777777",
	dob: "1990-01-01",
	address1: "225 Bush St",
	address2: "5th Floor",
	city: "San Francisco",
	state: "CA",
	zip: 94104,
	email: "second.donor@ga.co",
	password: "1234"
)

org2 = Organization.create(
	name:"American Red Cross", 
	email_domain: "@redcross.org", 
	logo:"https://redcrossdfw.files.wordpress.com/2015/08/gadgd.png", 
	address1:"2025 E Street NW", 
	address2:"", 
	city:"Washington DC", 
	state:"DC", 
	zip:20006
)

2tech1 = User.create(
	first: "RC",
	last: "Phleb",
	email: "rc.phleb1@redcross.org",
	is_tech?: true,
	password: "1234",
	organization_id: org2.id
)

2tech2 = User.create(
	first: "RC",
	last: "Stabber",
	email: "rc.phleb2@redcross.org",
	is_tech?: true,
	password: "1234",
	organization_id: org2.id
)