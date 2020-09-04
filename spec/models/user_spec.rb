require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a username" do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect{params = FactoryBot.attributes_for(:user).to be_valid}
  end

  it "validation for username uniqueness" do
    expect{params = FactoryBot.attributes_for(:username).should validate_uniqueness_of(:user_id)}
  end
  
  it "validation for email uniqueness" do
    expect{params = FactoryBot.attributes_for(:email).should validate_uniqueness_of(:user_id)}
  end
end