class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(params[:purchase])

    if @purchase.save
      flash[:confirm] = "Thanks! We've recorded it and will map it soon!"
    else
      flash[:error] = "#{@purchase.errors.full_messages.join("<br/>")}"
    end
    redirect_to(root_path)
  end
  
  def index
    @purchases = Purchase.all
  end
end
