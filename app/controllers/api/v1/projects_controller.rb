module Api
  module V1
    class ProjectsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        projects = Project.all
        render json: projects, status: :ok
      end

      # def weekly
      #   last = Project.last.week
      #   projects= Project.where(week: last)
      #   render json: projects, status: :ok
      # end

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

      def worksheet
        @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
        @spreedsheet ||= @session.spreadsheet_by_title("Project Data")
        @worksheet ||= @spreedsheet.worksheets.first
        @projects = (@worksheet.rows - [@worksheet.rows.first] - [@worksheet.rows.second])
        @week = @worksheet.rows.first
        if Project.all == [] || @week.second.to_i > Project.last.week
          @projects.each do |i|
            sn = i[0]
            status = i[1]
            project = i[2]
            start_date = i[3]
            end_date = i[4]
            extended_date = i[5]
            notes = i[6]
            no_of_resources = i[7]
            no_of_milestone = i[8]
            completed_milestone = i[9]
            missed_milestone = i[10]
            week = @week.second.to_i
            Project.create(sn: sn, status: status, project: project, start_date: start_date, end_date: end_date, extended_date: extended_date, notes: notes, week: week, no_of_resources: no_of_resources, no_of_milestone: no_of_milestone, completed_milestone: completed_milestone, missed_milestone: missed_milestone )
          end
        end
        projectData = Project.all
        render json: projectData, status: :ok
      end

      private
      def project_params
        params.permit(:sn, :status, :project, :start_date, :end_date, :extended_date, :notes, :week,
                       :no_of_resources, :no_of_milestone, :completed_milestone, :missed_milestone)
      end
    end
  end
end