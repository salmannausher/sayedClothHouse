class Admin::PaymentsController < AdminController
	def create
		@admin_payment = Payment.new(payment_params)
		@admin_payment.amount = @admin_payment.amount*-1
		@admin_payment.save
		redirect_to admin_clients_path
	end
	def index
		@admin_client = Client.find(params[:id])
		@q = Payment.where(client_id: params[:id]).ransack(params[:q])
		@payments = @q.result
	end
	def show
		@admin_payment = Payment.find(params[:id])
		# @admin_payments = admin_client.payments
	end
	def destroy
	@admin_payment = Payment.find(params[:id])
    @admin_payment.destroy
    respond_to do |format|
      format.html { redirect_to admin_clients_url, notice: 'Payment is successfully destroyed.' }
      format.json { head :no_content }
    end
  end
private

	 def payment_params
       params.require(:payment).permit(:client_id,:amount,:payment_type,:description)
    end

end
