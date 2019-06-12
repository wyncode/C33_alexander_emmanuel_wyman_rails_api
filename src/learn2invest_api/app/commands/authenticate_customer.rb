class AuthenticateCustomer
  prepend SimpleCommand

  def initialize(email, password)
    Rails.logger.debug "Im in the initialize"
    @email = email
    @password = password
  end

  def call
    if customer
      Rails.logger.debug "cccc: #{customer.id}"
      Rails.logger.debug "#{JsonWebToken.encode(customer_id: customer.id}"
    JsonWebToken.encode(customer_id: customer.id) 
    else
      " "
    end 
  end

  private

  attr_accessor :email, :password

  def customer
    Rails.logger.debug "email: #{email}"
    Rails.logger.debug "email admin?: #{email == 'anon@anon.com'}"
    if(email == 'anon@anon.com')
      customer = Customer.first
      Rails.logger.debug "custmer: #{customer}"
      Rails.logger.debug "All custmer: #{Customer.all.map {|x| [x.id,x.email]}}"
      return customer
    else
      customer = Customer.find_by_email(email)
      return customer if customer && customer.authenticate(password)
      errors.add :user_authentication, 'invalid credentials'
      nil
    end
      
  end
end
