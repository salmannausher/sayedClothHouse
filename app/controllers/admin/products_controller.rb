class Admin::ProductsController < AdminController
  authorize_resource
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/ascii_outputter'
  require 'barby/outputter/html_outputter'
  before_action :set_admin_product, only: [:show, :edit, :update,:get_price, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = Product.all
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  def get_price 
    respond_to do |format|
      format.js
    end
  end

  # GET /admin/products/new
  def new
    # @barcode = Barby::EAN13.new('012345678912')
    @admin_product = Product.new
    # 1.times { @admin_product.stocks.build }
  end

  # GET /admin/products/1/edit
  def edit
    # unless @admin_product.stocks.present?
    #   1.times { @admin_product.stocks.build }
    # end
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Product.new(admin_product_params)
    
    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_url, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to admin_products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
       params.require(:product).permit(:name,:vendor_id,:than,:gazan_per_than, :rate, :profit_percentage,:product_type, :sale_price,stocks_attributes: [:than,:gazana_per_than,:meter,:product_id])
    end
end
