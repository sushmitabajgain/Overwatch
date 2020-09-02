class Users::SessionsController < Devise::SessionsController
		
	#Disable CSRF protection
  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: :create

	#To be sure to enable JSON
	respond_to :html, :json

	#POST resource/sign_in
	def create
		@user = User.find_by_email(params[:email])
		if @user
			if @user.confirmed?
				if @user&.valid_password?(params[:password]) && @user.confirmed?
					token = JsonWebToken.encode(user_id: @user.id)
					time = Time.now + 24.hours.to_i
					render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
													username: @user.username, user_id: @user.id }, status: :ok
				else
					render json: { error: 'Invalid login Credentials error.' }, status: :unauthorized
				end
			else
				render json: { error: 'You have to confirm your email address before continuing.' }, status: :unconfirmed
			end
		else
			render json: {error: 'You need to sign up before continuing.'}, status: :unauthenticated
		end
	end

	private
	
	def sign_in_params
		devise_parameter_sanitizer.sanitize(:sign_in)
	end
end