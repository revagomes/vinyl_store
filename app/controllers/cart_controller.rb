class CartController < ApplicationController
  layout 'store'
  def index
  end
  
  def add
    @product = Product.find(params[:id])
    item = @order.order_items.find_by_product_id(@product.id)
    if item
      item.quantity = item.quantity + 1
    else
      item = @order.order_items.new :product => @product
    end
    item.save
    
    redirect_to :action => :index
  end

  def remove
    oi = @order.order_items.find(params[:id])
    oi.destroy
    @order.update_attribute :total, @order.order_items.sum(:total)
    redirect_to :action => :index
  end

  def update
    for id,quantity in arams[:item]
      @order.order_items.find(id).update_attribute :quantity, quantity
    end
    redirect_to :action => :index
  end
    
end

=begin
item = @order.order_items.find_by_product_id(@product.id)
if item 
  new_quantity = item.quantity+1
  item.update_attributes :quantity => new_quantity, :total => @product.price * new_quantity
else
  @order.order_items.create :product => @product, :quantity => 1, :total => @product.price
end
=end