class RecordsController < ApplicationController
  def index
    @record_form = RecordShippingForm.new
  end
end
