module AuthHelper
	def current_user
   	current_user ||= User.find(session[:user_id]) if session[:user_id]
   	return current_user
 	end

 	def signed_in?
  	!current_user.nil?
	end
end
