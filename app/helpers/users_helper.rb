module UsersHelper
	def get_adm
  		current_user.has_role? :admin
  	end
end
