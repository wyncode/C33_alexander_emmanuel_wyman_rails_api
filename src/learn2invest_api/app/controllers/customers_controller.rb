class CustomersController < ApplicationController
  skip_before_action :authenticate_request

  # before_action :set_customers, only: [:index]
  # before_action :set_customer_info, only: [:show, :create, :update, :destroy]

  #Show a Collection of Customers
  def index
    @customers = Customer.all
    if @customers 
    render json: {'customers': @customers } 
    end
  end

  #Show a single Customer
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

  #Create a Customer
  def create
    #http://localhost:3000/customers/
    # ?state=FL
    # &city=Pembroke Pines
    # &zip_code=33023
    # &first_name=Alex
    # &last_name=J
    # &mobile=9546463310
    # &street1=899 NW 156th AVE
    # &street2
    # &email=pop@aol.com
    ActiveRecord::Base.transaction do
      @state = State.create!(
      value:    params[:state])

      @zip_code = ZipCode.create!(
      value:    params[:zip_code])

      @city = City.create!(
        name:                 params[:city],
        state:                @state,
        zip_codes_id:         @zip_code.id)

      #assign City to the ZipCode 
      @zip_code.cities_id =   @city.id
      @zip_code.save
  
      @customer = Customer.new( customer_params.merge( {city_id: @city.id} ) )
      
      if @customer.save
        puts 'Customer created'
        authenticate
      else
        puts 'Customer not created'
      end
    end
  end
  
  def login
    authenticate
  end
  
  #Update a Customer info 
  def update
    begin
      @customer = Customer.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
      @customer = nil
      puts 'customer not found'
    end

    @city = @customer.city
    @state = @customer.city.state
    @zip_code = ZipCode.find(@customer.city.zip_codes_id)

    ActiveRecord::Base.transaction do
      @customer.update(
        first_name: params[:first_name],
        last_name:  params[:last_name],
        mobile:     params[:mobile],
        street1:    params[:street1],
        street2:    params[:street2],
        email:      params[:email])

      @state.update!(
      value:    params[:state])

      @zip_code.update!(
      value:    params[:zip_code])

      @city.update(name:  params[:city],
      state:                @state,
      zip_codes_id:         @zip_code.id) 
    end
  end

  #Delete a customer
  def destroy
    begin
      @customer = Customer.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
      @customer = nil
      puts 'customer not found'
    end

    if @customer
      @customer.destroy
    end
  end

  private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_customers
  #   @customers = Customer.all 
  # end

  # def set_customer_info
  #   begin
  #     @customer = Customer.find(params[:id])
  #     rescue ActiveRecord::RecordNotFound => e
  #     @customer = nil
  #     puts 'customer not found'
  #   end
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :password, :password_confirmation, :mobile, :street1, :street2, :email, :city, :zip_code, :state )
  end
end
