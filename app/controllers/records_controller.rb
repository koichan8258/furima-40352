class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @record_shipping = RecordShipping.new
  end

  def new
    @record_shipping = RecordShipping.new
  end

  def create
    @record_shipping = RecordShipping.new(record_params)
    if @record_shipping.valid?
      @record_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end


  private

  def record_params
    params.require(:record_shipping).permit(:post_cord, :prefecture_id, :municipalities, :street_address, :building_name, :telephon_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end



end
