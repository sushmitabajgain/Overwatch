module Api
  module V1
    class MilestonesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :get_week, only: :index

      def index
        @milestones = @week.milestones.all.order("created_at DESC")
        render json: @milestones, status: :ok
      end

      def milestones
        @milestones = Milestone.all
        render json: @milestones, status: :ok
      end
      
      private

      def get_week
        @week = Week.find(params[:week_id])
      end

      def milestone_params
        params.permit(:project, :no_of_milestones, :missed_milestones, :completed_milestones, :week)
      end
    end
  end
end
