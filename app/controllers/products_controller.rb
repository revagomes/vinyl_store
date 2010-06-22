class ProductsController < ApplicationController
  def list
    @products = Product.all
  end

  def add
    @product = Product.new
  end

  def save
	# raise params.inspect // Exibe o conteúdo do request
	@product = Product.new params[:product]
	if @product.save
		flash[:success] = "Produto salvo com sucesso"
		redirect_to :action => :list
	else
		render :action => :add
	end
  end

end
