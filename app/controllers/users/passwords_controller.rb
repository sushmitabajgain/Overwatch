class Users::PasswordsController < DeviseController
	def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
			redirect_to root_path
    else
      respond_with(resource)
    end
	end
	
	def edit
		self.resource = resource_class.new
		set_minimum_password_length
		resource.reset_password_token = params[:reset_password_token]
end

	# PUT /resource/password
def update
		self.resource = resource_class.reset_password_by_token(resource_params)
		yield resource if block_given?

		if resource.errors.empty?
		resource.unlock_access! if unlockable?(resource)
		if Devise.sign_in_after_reset_password
				flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
				set_flash_message!(:notice, flash_message)
				resource.after_database_authentication
				sign_in(resource_name, resource)
		else
				set_flash_message!(:notice, :updated_not_active)
		end
		respond_with resource, location: after_resetting_password_path_for(resource)
		else
		set_minimum_password_length
		respond_with resource
		end
end

protected

def after_resetting_password_path_for(resource)
		Devise.sign_in_after_reset_password ? after_sign_in_path_for(resource) : root_path(resource_name)
end

# The path used after sending reset password instructions
def after_sending_reset_password_instructions_path_for(resource_name)
		new_session_path(resource_name) if is_navigational_format?
end

# Check if a reset_password_token is provided in the request
def assert_reset_token_passed
		if params[:reset_password_token].blank?
				set_flash_message(:alert, :no_token)
				redirect_to new_session_path(resource_name)
		end
end
def unlockable?(resource)
		resource.respond_to?(:unlock_access!) &&
			resource.respond_to?(:unlock_strategy_enabled?) &&
			resource.unlock_strategy_enabled?(:email)
end
end