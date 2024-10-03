class CustomersController < ApplicationController
  def customer_address
  end

  def customer_address_update
    current_user.update!(address: params[:address])
    redirect_to customer_address_path
  end
end
