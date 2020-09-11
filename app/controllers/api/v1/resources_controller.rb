module Api
  module V1
    class ResourcesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def resources
        @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
        @spreedsheet ||= @session.spreadsheet_by_title("Resource Data")
        @worksheet ||= @spreedsheet.worksheets.first
        @resources = @worksheet.rows - [@worksheet.rows.first]
        if Resource.all == []
          @resources.each do |i|
            multiple = i[0]
            name = i[1]
            Resource.create(multiple: multiple, name: name)
          end
        end
        @resourceData = Resource.all
        render json: @resourceData, status: :ok
      end
    end
  end
end