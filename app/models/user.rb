class User < ActiveRecord::Base
	has_many :donations
	has_many :organizations, through: :donations

	has_secure_password

	def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

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
end
