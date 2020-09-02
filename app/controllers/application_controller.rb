require 'json_web_token'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :html, :json

  def index
    render template: 'application'
  end

  def not_found
    render json: { error: 'not_found' }
  end

  protected

  def current_user=(user)
    session[:user_id] = user&.id
    @current_user = user
  end

  def configure_permitted_parameters
    update_attrs = [:email, :password, :role]
    devise_parameter_sanitizer.permit(:sign_up, keys: update_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
