require 'rails_helper'

RSpec.describe Api::V1::UsersController do

	def token_generator(email, password)
		@user = User.find_by_email(email)
		@token = JsonWebToken.encode(user_id: @user.id)
		return @token
	end

	describe 'POST CREATE' do
		let(:user) { FactoryBot.build(:user) }
		it "returns http success" do
			expect(response).to have_http_status(:success)
		end
	end

	describe 'GET INDEX' do
		let(:role) {FactoryBot.create(:role)}
		let(:user) { FactoryBot.create(:user, role_id: role.id) }
		
		before do
			token = token_generator(user.email, user.password)
			headers = { :Authorization => @token }
			request.headers.merge! headers
			get :index, format: :json
		end
		it "returns http success" do
			expect(response).to have_http_status(:ok)
		end
	end

	describe 'Get #show' do
		let(:role) {FactoryBot.create(:role)}
		let(:user) { FactoryBot.create(:user, username: "test", role_id: role.id) }
		before do
			token = token_generator(user.email, user.password)
			headers = { :Authorization => @token }
			request.headers.merge! headers
			get :show, params:{id: user.id}, format: :json
		end
		it "returns http success" do
			expect(response).to have_http_status(:ok)
		end

		it "returns username with test" do
			json = JSON.parse(response.body)
			expect(json['username']).to eql("test")
		end
	end

	describe 'Update user' do
		let(:role) {FactoryBot.create(:role)}
		let(:user) { FactoryBot.create(:user, role_id: role.id) }
		before do
			token = token_generator(user.email, user.password)
			headers = { :Authorization => @token }
			request.headers.merge! headers
			patch :update, params:{id: user.id, password: "Test@123"}, format: :json
		end

		it "returns http success" do
			expect(response).to have_http_status(:created)
		end
	end

	describe 'Delete #destroy' do
	  let(:role) {FactoryBot.create(:role)}
	  let(:user) { FactoryBot.create(:user, role_id: role.id) }
		before do
			token = token_generator(user.email, user.password)
			headers = { :Authorization => @token }
			request.headers.merge! headers
			delete :destroy, params:{id: user.id}, format: :json
		end
		it "returns http success" do
			expect(response).to have_http_status(:ok)
		end  
		it "returns message deleted successfully" do
			json = JSON.parse(response.body)
			expect(json['success']).to eql('deleted successfully')
		end
	end
end