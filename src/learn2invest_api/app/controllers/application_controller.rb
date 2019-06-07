class ApplicationController < ActionController::API
  before_action :authenticate_request, :cors_preflight_check

  attr_reader :current_customer
  # helper_method :current_customer

  private

  def authenticate_request
    @current_customer = AuthorizeApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_customer
  end

  # Turn off CORS.
  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def authenticate
    command = AuthenticateCustomer.call(params[:customer][:email], params[:customer][:password])
    if command.success?
      { auth_token: command.result, status: 200 }
    else
      { error: command.errors, status: 401 }
    end
  end

end
