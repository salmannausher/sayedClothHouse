class Payment < ApplicationRecord
	default_scope  {order('created_at asc')}
	belongs_to :client, optional: true
	belongs_to :order, optional: true
	after_save :calculate_remaining_amount

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
end
