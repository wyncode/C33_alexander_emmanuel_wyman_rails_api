class AuthenticateCustomer
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(customer_id: customer.id) if customer
  end

  private

  attr_accessor :email, :password

  def customer
    byebug
    customer = Customer.find_by_email(email)
    return customer if customer && customer.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
