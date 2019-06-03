class CustomersController < ApplicationController
  skip_before_action :authenticate_request
 
  def index
    @customers = Customer.all 
    render json: {'customers': @customers } 
  end

  def show
    begin
    @customer = Customer.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
    @customer = nil
    puts 'customer not found'
    end

    if @customer 
      render json: {'customer': @customer} 
    end
  end
end
