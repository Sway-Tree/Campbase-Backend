class UserController < ApplicationController
	def info
		render :json => current_user
	end
end