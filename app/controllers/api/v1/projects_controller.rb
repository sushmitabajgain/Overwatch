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

      def worksheet
        @session = GoogleDrive::Session.from_config('google_credentials.json')
        @spreedsheet ||= @session.spreadsheet_by_title("Eagle Eye")
        @worksheet ||= @spreedsheet.worksheets.first
        @projects = (@worksheet.rows - [@worksheet.rows.first] - [@worksheet.rows.second])
        render json: @projects, status: :ok
      end

      private

      def get_week
        @week = Week.find(params[:week_id])
      end
      
      def project_params
        params.permit(:project, :project_health, :project_timeline, :workload,
          :week, :pending_raid, :milestone_status, :notes)
      end
    end
  end
end