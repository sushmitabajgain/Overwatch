module Api
  module V1
    class ResourcesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :get_week, only: :index

      def index
        @resources = @week.resources.all.order("created_at DESC")
        render json: @resources, status: :ok
      end

      def resources
        @resources = Resource.all
        render json: @resources, status: :ok
      end
      private

      def get_week
        @week = Week.find(params[:week_id])
      end

      def resource_params
        params.permit(:project, :no_of_resources, :week)
      end
    end
  end
end