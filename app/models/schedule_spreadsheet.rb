class ScheduleSpreadsheet < ApplicationRecord
  def self.get_worksheet
    @session = GoogleDrive::Session.from_config('google_credentials.json')
    @spreedsheet ||= @session.spreadsheet_by_title("Eagle Eye")
    @worksheet ||= @spreedsheet.worksheets.first
    @projects = (@worksheet.rows - [@worksheet.rows.first] - [@worksheet.rows.second])
    @week = Week.create(week: Time.now)
    @projects.each do |i|
      project = i[0]
      project_health = i[1]
      project_timeline = i[2]
      workload = i[3]
      pending_raid = i[4]
      milestone_status = i[5]
      notes = i[6]
      week = @week
      if i[0] == "--break--"
        break
      end
      ScheduleProjectJob.perform_now(project, project_health, project_timeline, workload, pending_raid, milestone_status, notes, week)
    end

    @resource_worksheet ||= @spreedsheet.worksheets.second
    @resources = (@resource_worksheet.rows - [@resource_worksheet.rows.first] - [@resource_worksheet.rows.second])
    @resources.each do |i|
      project = i[0]
      no_of_resources = i[1]
      week = @week
      if i[0] == "Total"
        break
      end
      ScheduleResourceJob.perform_now(project, no_of_resources, week)
    end

    @resource_worksheet ||= @spreedsheet.worksheets.third
    @resources = (@resource_worksheet.rows - [@resource_worksheet.rows.first] - [@resource_worksheet.rows.second])
    @resources.each do |i|
      project = i[0]
      no_of_milestones = i[1]
      missed_milestones = i[2]
      completed_milestones = i[3]
      week = @week
      if i[0] == "--break--"
        break
      end
      ScheduleMilestoneJob.perform_now(project, no_of_milestones, missed_milestones, completed_milestones, week)
    end
  end
end