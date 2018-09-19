class Payment < ApplicationRecord
	default_scope  {order('created_at asc')}
	belongs_to :client, optional: true
	belongs_to :order, optional: true
	after_create :calculate_remaining_amount
  after_update :change_remaing_amount
  after_destroy :change_remaing_amount
  def calculate_remaining_amount
  	if self.client.payments.count == 1
  		remaining_amount = self.amount
  	else
  		remaining_amount = self.amount+self.client.payments.offset(1).last.remaining_amount.to_f
  	end
  	#byebug
  	 # if self.order.first?
	  # 	remaining = self.order.grand_total
	  self.update_column(:remaining_amount,remaining_amount )
	  # else
	  # 	remaining = 

  end
    def change_remaing_amount
    payments = self.client.payments
    payments.each_with_index do |payment,index|
      if index === 0
        payment.update_column(:remaining_amount, payment.amount)
      else
        #previous payment'remaining amiunt and  plus this payment amount
        payment.update_column(:remaining_amount, payment.amount+payments[index-1].remaining_amount)
      end

    end
  end

end
