class AdminController < ApplicationController
	before_action :authenticate_user!
	before_filter :is_admin?
		layout 'admin'
	def is_admin?
  	if current_user.admin?
    	true
  	else
   		render :text => "You are not authorised to perform this action", :status => :unauthorized
  	end
  end

	def index
		
	end
end
