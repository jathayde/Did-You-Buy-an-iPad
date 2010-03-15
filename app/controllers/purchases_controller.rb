class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(params[:purchase])

    if @purchase.save
      flash[:notice] = 'Thanks!'
    else
      flash[:error] = 'That didn\'t work, yo'
    end
    redirect_to(pages_path)
  end
end
