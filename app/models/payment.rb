class Payment < ApplicationRecord
  acts_as_paranoid
	default_scope  {order('order_id asc')}
	belongs_to :client, optional: true
	belongs_to :order, optional: true
	before_create :calculate_remaining_amount
  after_save :add_order_date
  after_update :change_remaing_amount
  after_destroy :change_remaing_amount
  def calculate_remaining_amount
  	if self.client.payments.count == 0
  		remaining_amount = self.amount
  	else
      # byebug
  		remaining_amount = self.amount+self.client.payments.unscope(:order).last.remaining_amount.to_f
  	end
  	 # if self.order.first?
	  # 	remaining = self.order.grand_total
    puts remaining_amount
	  # self.update_column(:remaining_amount,remaining_amount )
    self.remaining_amount = remaining_amount
	  # else
	  # 	remaining = 

  end
        
  def client
    Client.with_deleted.find(client_id)
  end
  def add_order_date
    if self.order.present?
      if self.order.order_date.present?
        self.update_column(:created_at, self.order.order_date)
      end
    end
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
