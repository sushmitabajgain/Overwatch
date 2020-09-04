module Api
  module V1
    class ProjectsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def worksheet
        @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
        @spreedsheet ||= @session.spreadsheet_by_title("Project Data")
        @worksheet ||= @spreedsheet.worksheets.first
        @project = @worksheet.rows
        # @projectData = @project.map.with_index { |ch, idx| [ch, idx] }
        render json: @project, status: :ok
      end
    end
  end
end