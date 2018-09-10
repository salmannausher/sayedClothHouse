
class AdminController < ApplicationController
	before_action :authenticate_user!
#load_and_authorize_resource
   # before_filter :is_admin?
		layout 'admin'
		rescue_from CanCan::AccessDenied do |exception|
    		redirect_to admin_orders_path, :alert => exception.message
  		end
	# def is_admin?
 #  	if current_user.has_role? :worker
 #  		#redirect_to admin_orders_path
 #  	end
 #  end

	def index
		@total_orders = Order.all.count
		@total_clients = Client.all.count
		@total_products = Product.all.count
	end
end
