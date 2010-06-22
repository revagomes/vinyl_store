class HomeController < ApplicationController
  def index
    @products = Product.front.with_stock
	@payment_methods = PaymentMethod.active
  end
  
  def product
    @product = Product.find(params[:id])
  end
  
  def payment_methods
	@payment_methods = PaymentMethod.active
  end
end
