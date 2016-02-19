class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new_tech
		@organization = Organization.find_by_id(params[:organization_id])
		@user = User.new
	end

end
