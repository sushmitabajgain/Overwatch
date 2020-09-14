module Api
  module V1
    class ProjectsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        projects = Project.all
        render json: projects, status: :ok
      end

      def getStatusCount
        @count = [
                  Project.where(status: "On Track").count,
                  Project.where(status: "Need to Discuss/Back on Track").count,
                  Project.where(status: "Project on Halt").count,
                  Project.where(status: "Out of Deadline").count,
                  Project.where(status: "Completed Project").count
                ]
        render json: @count ,status: :ok
      end

      private
      
      def project_params
        params.permit(:sn, :status, :project, :start_date, :end_date, :extended_date, :notes, :week,
                       :no_of_resources, :no_of_milestone, :completed_milestone, :missed_milestone)
      end
    end
  end
end