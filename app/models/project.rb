class Project < ApplicationRecord
  def self.get_worksheet
    @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
    @spreedsheet ||= @session.spreadsheet_by_title("Project Data")
    @worksheet ||= @spreedsheet.worksheets.first
    @projects = (@worksheet.rows - [@worksheet.rows.first] - [@worksheet.rows.second])
    @week = @worksheet.rows.first
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
        ScheduleJob.perform_now(sn, status, project, start_date, end_date, extended_date, notes, no_of_resources, no_of_milestone, completed_milestone, missed_milestone, week)
      end
  end
end