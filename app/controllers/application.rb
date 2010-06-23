# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd894e3d02795487250d3943084291e35'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :set_order # pode receber um hash para :only ou :exept
   
  protected
   
=begin
  def set_order
    # raise session[:order_id].to_s
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
    end
    session[:order_id] = @order.id
  rescue ActiveRecord::RecordNotFound => e # Trata uma excessão de deletar o produto pelo console com a seção ativa
   @order= Order.create
   session[:order_id] = @order.id
  end
=end
  # Refatorando a função acima
  def set_order
   @order = Order.find(session[:order_id]) rescue Order.create
   session[:order_id] = @order.id
  end
   
end
