module UsersHelper
	
	def tech?
		if current_user
			@current_user.is_tech?
		end
	end

	def affiliated_org?
		if tech?
			@org = Organization.find_by_id(@current_user.organization_id)
		end
	end

end
