class Users::ConfirmationsController < DeviseController
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?
      if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){redirect_to root_path}
      end
  end

  protected

  #Override The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      signed_in_root_path(resource)
    else
      root_path(resource_name)
    end
  end
end