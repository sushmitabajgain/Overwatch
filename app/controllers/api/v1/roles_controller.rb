module Api
  module V1
    class RolesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_role, only: [:show, :edit, :update, :destroy]
      
      # GET /roles
      def index
        roles = Role.all
        render json: roles, status: :ok
      end

      # GET /roles/1
      def show
        role = Role.find(params[:id])
        if !role.nil?
            render json: role, status: :ok
        else
            render json: {errors: role.errors.full_messages}, status: :unprocessable_entity
        end
      end

      # POST /roles
      def create
        @role = Role.new(role_params)
        if @role.save
          render json: @role, status: :created
        else
          render json: { errors: @role.errors.full_messages },
                  status: :unprocessable_entity
        end
      end

      # PATCH/PUT /roles/1
      def update
        role = Role.find(params[:id])
        if role.update(role_params)
          render json: role, status: :created
        else
          render json: { errors: role.errors.full_messages },
                  status: :unprocessable_entity
        end
      end

      # DELETE /roles/1
      def destroy
        role = Role.find(params[:id])
        if role.destroy
            render json: {success: "deleted successfully"}, status: :ok
        else
            render json: {errors: role.errors.full_messages}, status: :not_acceptable
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_role
          role = Role.find(params[:id])
        end

        def role_params
          params.permit(:name)
        end
    end
  end
end
