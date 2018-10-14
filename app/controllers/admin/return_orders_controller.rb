class Admin::ReturnOrdersController < AdminController
  before_action :set_admin_order, only: [:edit, :update,:show]
  authorize_resource :class => :return_order
  def index
    @return = Order.where(order_type: "return_invoice")
  end

  def new
    @admin_order = Order.new
    1.times { @admin_order.line_items.build }
  end
  def show
    
  end
  def edit
  end

  def create
    @admin_order =  Order.new(return_order_params)
      respond_to do |format|
      if @admin_order.save
        format.html { redirect_to admin_return_orders_url, notice: 'Reurn Order was successfully created.' }
        format.json { render :show, status: :created, location: @admin_order }
      else
        format.html { render :new }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @admin_order.update(return_order_params)
        format.html { redirect_to admin_return_orders_url, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_order }
      else
        format.html { render :edit }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_admin_order
      @admin_order = Order.find(params[:id])
    end

  def return_order_params
     params.require(:order).permit(:client_id,:shipping_charges,:order_type,:order_date, line_items_attributes: [:id, :quantity, :size, :than, :item_name, :gaz_per_than, :meter, :price_per_meter, :total_price, :product_id])
  end

end
