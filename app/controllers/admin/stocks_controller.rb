class Admin::StocksController < AdminController
	# before_action :set_admin_stock,  only: [:show, :edit, :update, :destroy]

	def create
		@admin_stock = Stock.new(stock_params)
		@admin_stock.meter = stock_params[:than].to_f  * stock_params[:gazana_per_than].to_f
		@admin_stock.save
		redirect_to admin_products_path
	end
	def show
		admin_product = Product.find(params[:id])
		@admin_stocks = admin_product.stocks
	end
	def destroy
		@admin_stock = Stock.find(params[:id])
	    @admin_stock.destroy
	    respond_to do |format|
	      format.html { redirect_to admin_products_path, notice: 'Stock is successfully destroyed.' }
	      format.json { head :no_content }
    end
  end
private
	 def set_admin_stock
      @admin_stock = Stock.find(params[:id])
    end
	 def stock_params
       params.require(:stock).permit(:than,:gazana_per_than,:product_id, :meter)
    end
end
