module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authorize_request, except: [:create, :update]

      # GET /users
      def index
        @users = User.all
        render json: @users, status: :ok
      end
  
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
        end
      end

      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages },
            status: :unprocessable_entity
        end
      end

      def show
        user = User.find(params[:id])
        if !user.nil?
          render json: user, status: :ok
        else
          render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
          user = User.find(params[:id])
          if user.destroy
              render json: {success: "deleted successfully"}, status: :ok
          else
              render json: {errors: user.errors.full_messages}, status: :not_acceptable
          end
      end


      private
      def find_user
        @user = User.find_by_username!(params[:_username])
        rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end
      
      def user_params
        params.permit(:email, :username, :password)
      end
    end
  end
end
