class HomeController < ApplicationController
  filter_parameter_logging :password # filtra todos os parametros passados na hora da criação do log
  layout 'store'
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
  
  def cook
    cookies[:username] = {:value => 'Maria', :expires => 50.days.from_now}
    render :text => cookies[:username]
  end
  
  def login
    return unless request.post?
    user = User.find_by_login_and_password params[:login],params[:password]
    if user
      session[:user_id] = user.id
      redirect_to '/', :success => 'Login realizado com sucesso'
    else
      flash[:failure] = 'Usuário e senha inválidos'
      redirect_to '/home/login' 
    end
  end
  
end
