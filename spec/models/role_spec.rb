require 'rails_helper'

RSpec.describe Role, type: :model do
  it "is not valid without a name" do
    role = Role.new(name: nil)
    expect(role).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect{params = FactoryBot.attributes_for(:role).to be_valid}
  end

  it "validation for one role" do
    expect{params = FactoryBot.attributes_for(:name).should validate_uniqueness_of(:role_id)}
  end
end