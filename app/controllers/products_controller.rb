class ProductsController < ApplicationController
	def index
	   @products = Product.order("name").page(params[:page]).per(2)
	 end
	 
	 def show
	   @product = Product.find(params[:id])
	 end
	 
	 def new
	   @product = Product.new
	 end
	 
	 def create
	 	#debugger
	   @product = Product.new(product_params)
	   if @product.save
	     flash[:notice] = "Successfully created product."
	     redirect_to @product
	   else
	     render :action => 'new'
	   end
	 end
	 
	 
	 
	 
	 def destroy
	   @product = Product.find(params[:id])
	   @product.destroy
	   flash[:notice] = "Successfully destroyed product."
	   redirect_to products_url
	 end

	 private

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
