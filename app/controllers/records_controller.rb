class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record_form = RecordShippingForm.new
  end
end
