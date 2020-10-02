# Create Google Credentials File

File.open('google_credentials.json', 'w') { |w| w.write JSON.parse(ENV['GOOGLE_CREDENTIALS']) }
content = File.read('google_credentials.json').gsub('=>', ':')
File.open('google_credentials.json', 'w') { |w| w.write content }
