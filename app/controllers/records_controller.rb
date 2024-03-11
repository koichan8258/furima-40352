class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record_form = RecordShippingForm.new
  end

  def create
    @record_form = RecordShippingForm.new(record_params)
    if @record_form.valid?
      @record_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def record_params
    params.require(:record_form).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number)
  end


end
