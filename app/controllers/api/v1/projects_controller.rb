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

      # def worksheet
      #   @session = GoogleDrive::Session.from_config('google_credentials.json')
      #   @spreedsheet ||= @session.spreadsheet_by_title("Eagle Eye")
      #   @worksheet ||= @spreedsheet.worksheets.second
      #   @projects = @worksheet.rows
      #   # x = 1
      #   @projects.each do |i|
      #       p i
      #   #     # project = i[0]
      #   #     # project_health = i[1]
      #   #     # project_timeline = i[2]
      #   #     # workload = i[3]
      #   #     # pending_raid = i[4]
      #   #     # milestone_status = i[5]
      #   #     # notes = i[6]
      #   #     # x += 1
      #   end
      #   # @pro = @listing.rows
      #   render json: @projects, status: :ok
      # end

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