class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    render :new
  end

  def create
    @request = CatRentalRequest.new(cat_rental_request_params)
    if @request.save
      redirect_to cat_url(@request)
    else
      render :new
    end
  end

  def approve
    request = CatRentalRequest.find_by_id(params[:id])
    request.approve!
    redirect_to cat_url(request.cat_id)
  end

  def deny
    request = CatRentalRequest.find_by_id(params[:id])
    request.deny!
    redirect_to cat_url(request.cat_id)
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end