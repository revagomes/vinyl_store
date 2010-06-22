class AjaxController < ApplicationController
  def index
  end

  def ajax
    respond_to do |format|
	  format.html
	  format.js { render :json => Product.front.with_stock }
	end  
  end

end
