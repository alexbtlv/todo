class WelcomeController < ApplicationController
	def home
		redirect_to todos_path and return if user_signed_in?
	end
end
