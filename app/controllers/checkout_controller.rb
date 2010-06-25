class CheckoutController < ApplicationController
  before_filter :require_user
  
  def index
  end

  protected
  def require_user
    @user = User.find(session[:user_id])
  rescue
    redirect_to :controller => :home, :action => :login
  end
end
