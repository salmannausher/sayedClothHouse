class Admin::OrdersController < AdminController
  authorize_resource
  before_action :set_admin_order, only: [:show, :edit, :update, :destroy]
  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @admin_orders = Order.all
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
  end

  # GET /admin/orders/new
  def new
    @admin_order = Order.new
    1.times { @admin_order.line_items.build }
  end

  # GET /admin/orders/1/edit
  def edit
  end

  # POST /admin/orders
  # POST /admin/orders.json
  def create
    @admin_order = Order.new(admin_order_params)
    respond_to do |format|
      if @admin_order.save
        format.html { redirect_to admin_orders_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @admin_order }
      else
        format.html { render :new }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/orders/1
  # PATCH/PUT /admin/orders/1.json
  def update
    respond_to do |format|
      if @admin_order.update(admin_order_params)
        format.html { redirect_to admin_orders_url, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_order }
      else
        format.html { render :edit }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/orders/1
  # DELETE /admin/orders/1.json
  def destroy
    @admin_order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_order
      @admin_order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_order_params
      params.require(:order).permit(:client_id,:line_item_id,:order_type,:order_date,:gazana_num,:shipping_charges,:discount, line_items_attributes: [:id, :quantity, :size, :than, :item_name, :gaz_per_than, :meter, :price_per_meter, :total_price, :product_id])
    end
end
