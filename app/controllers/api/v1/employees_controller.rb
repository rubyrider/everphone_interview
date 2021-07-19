class Api::V1::EmployeesController < ApplicationController
  def gift
    @gifts = GiftService.new(params.require(:id)).assign

    if stale?(@gifts)
      render json: @gifts
    end
  end
end
