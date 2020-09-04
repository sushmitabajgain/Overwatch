require 'rails_helper'

RSpec.describe Api::V1::RolesController do

	describe 'POST CREATE' do
		let(:role) { FactoryBot.build(:role) }
		it "returns http success" do
			expect(response).to have_http_status(:success)
		end
	end

	describe 'GET INDEX' do
		let(:role) {FactoryBot.create(:role)}		
		before do
			get :index, format: :json
		end
		it "returns http success" do
			expect(response).to have_http_status(:ok)
		end
	end

	describe 'Get #show' do
		let(:role) {FactoryBot.create(:role)}
		before do
			get :show, params:{id: role.id}, format: :json
		end
		it "returns http success" do
			expect(response).to have_http_status(:ok)
		end

		it "returns username with test" do
			json = JSON.parse(response.body)
			expect(json['name']).to eql("admin")
		end
	end

	describe 'Update user' do
		let(:role) {FactoryBot.create(:role)}
		before do
			patch :update, params:{id: role.id, name: "pmo"}, format: :json
		end

		it "returns http success" do
			expect(response).to have_http_status(:created)
		end
	end

	describe 'Delete #destroy' do
	  let(:role) {FactoryBot.create(:role)}
		before do
			delete :destroy, params:{id: role.id}, format: :json
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