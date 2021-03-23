FactoryBot.define do
  factory :user do
    username {"testing"}
    email {"test@gmail.com"}
    password { "Admin@123"}
    role_id { 1 }
    image {"image.jpg"}
    created_at {"2019-11-07 06:34:52 +0000"}
  end
end


