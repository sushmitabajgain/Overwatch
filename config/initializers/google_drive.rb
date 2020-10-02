# Create Google Credentials File
file = {
  'client_id' => ENV['GOOGLE_CLIENT_ID'],
  'client_secret' => ENV['GOOGLE_CLIENT_SECRET'],
  'scope' => [
    'https://www.googleapis.com/auth/drive',
    'https://spreadsheets.google.com/feeds/'
  ],
  'refresh_token' => ENV['GOOGLE_REFRESH_TOKEN']
}

File.open('google_credentials.json', 'w') { |w| w.write file.to_json }