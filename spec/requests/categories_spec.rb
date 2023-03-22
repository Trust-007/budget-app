require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/categories'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'Check content of page' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/categories'
    end

    it 'includes placeholder text' do
      expect(response.body).to include('Add a new category')
    end
  end

  describe 'Get /new' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/categories/new'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'new' template" do
      expect(response).to render_template(:new)
    end
  end

  describe 'Check content of new page' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/categories/new'
    end

    it 'includes button text' do
      expect(response.body).to include('Save')
    end

    it 'includes label text' do
      expect(response.body).to include('Name')
    end
  end
end
