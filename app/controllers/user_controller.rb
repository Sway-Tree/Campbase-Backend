class UserController < Devise::SessionsController
	def index
		render :json => [current_user.email]
	end
end