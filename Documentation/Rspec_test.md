#To run rspec test for rails code:

bundle exec rspec spec

#to run all Controllers
1.  rspec --format documentation spec/controllers/api/v1/*

#For specific Controller
eg: To run test case for user's Controller use:
1.  rspec --format documentation spec/controllers/api/v1/users_controller_spec.rb

#To create multiple factory data using FactoryBot loop
eg:
FactoryBot.define do
  sequence :username do |n|
    "test#{n}"
  end
end

#For jobs
bundle exec rspec --format documentation spec/jobs/*