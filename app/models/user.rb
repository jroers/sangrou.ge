class User < ActiveRecord::Base
	has_many :donations
	has_many :organizations, through: :donations

	has_secure_password
end
