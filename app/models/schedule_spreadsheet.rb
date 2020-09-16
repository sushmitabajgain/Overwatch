class ScheduleSpreadsheet < ApplicationRecord
  def self.get_worksheet
    @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
      @spreedsheet ||= @session.spreadsheet_by_title("Project Data")
      @worksheet ||= @spreedsheet.worksheets.first
      @projects = (@worksheet.rows - [@worksheet.rows.first] - [@worksheet.rows.second])
      @week = @worksheet.rows.first
      Week.create(week: @week.second.to_i)
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
          ScheduleProjectJob.perform_now(sn, status, project, start_date, end_date, extended_date, notes, no_of_resources, no_of_milestone, completed_milestone, missed_milestone, week)
        end
      
      @resource_spreedsheet ||= @session.spreadsheet_by_title("Resource Data")
      @resource_worksheet ||= @resource_spreedsheet.worksheets.first
      @resources = @resource_worksheet.rows - [@resource_worksheet.rows.first]
      @resources.each do |i|
        multiple = i[0]
        name = i[1]
        week = @week.second.to_i
        ScheduleResourceJob.perform_now(multiple, name, week)
      end
  end
end