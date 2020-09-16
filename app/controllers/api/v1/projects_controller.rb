module Api
  module V1
    class ProjectsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :get_week, only: :index

      def index
        projects = @week.projects.all.order("created_at DESC")
        render json: projects, status: :ok
      end

      def projects
        projects = Project.all.order("created_at DESC")
        render json: projects, status: :ok
      end

      private

      def get_week
        @week = Week.find(params[:week_id])
      end
      
      def project_params
        params.permit(:sn, :status, :project, :start_date, :end_date, :extended_date, :notes, :week_id,
                       :no_of_resources, :no_of_milestone, :completed_milestone, :missed_milestone)
      end
    end
  end
end