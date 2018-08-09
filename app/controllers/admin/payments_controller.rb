class Admin::PaymentsController < AdminController
	def create
		@admin_payment = Payment.new(payment_params)
		@admin_payment.amount = @admin_payment.amount*-1
		@admin_payment.save
		redirect_to admin_clients_path
	end
	def show
		@admin_client = Client.find(params[:id])
		# @admin_payments = admin_client.payments
	end
private

	 def payment_params
       params.require(:payment).permit(:client_id,:amount,:payment_type,:description)
    end

end
