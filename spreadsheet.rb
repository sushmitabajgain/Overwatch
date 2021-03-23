require "google_drive"

@session = GoogleDrive::Session.from_config("client_secret.json")
@spreedsheet ||= @session.spreadsheet_by_title("Eagle Eye")
@worksheet ||= @spreedsheet.worksheets.first