# frozen_string_literal: true

puts 'Seeding roles...'
role_json = JSON.parse(File.read('db/seeds/data/roles.json'))

role_json.each do |a|
  Role.find_or_create_by!(name: a)
end
