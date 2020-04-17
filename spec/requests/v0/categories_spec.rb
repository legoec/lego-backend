require 'rails_helper'

RSpec.describe 'Describe API', type: :request do
  # initialize test data
  let!(:categories) { create_list(:category, 10) }
  let(:category_id) { categories.first.id }

  # Test suite for GET /api/v0/categories
  describe 'GET /api/v0/categories' do
    let(:user) { create :user }
    before { login_as user }
    # make HTTP get request before each example
    before { get_with_headers '/api/v0/categories' }

    it 'returns categories' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/v0/categories/:id
  describe 'GET /api/v0/categories/:id' do
    let(:admin) { create :user, :admin_user }
    before { login_as admin }
    before { get_with_headers "/api/v0/categories/#{category_id}" }

    context 'when the record exists' do
      it 'returns the category' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(category_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:category_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /api/v0/categories
  describe 'POST /api/v0/categories' do
    # valid payload
    let(:admin) { create :user, :admin_user }
    let(:valid_attributes) { { category: { name: 'Learn Elm', percentage: 10, active: true } } }
    let(:invalid_attributes) { { category: { name: 'Learn Elm' } } }

    context 'when the request is valid' do
      before { login_as admin }
      before { post_with_headers '/api/v0/categories', valid_attributes }

      it 'creates a category' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { login_as admin }
      before { post_with_headers '/api/v0/categories', invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"errors\":{\"percentage\":[\"can't be blank\"]}}")
      end
    end
  end

  # Test suite for PUT /api/v0/categories/:id
  describe 'PUT /api/v0/categories/:id' do
    let(:valid_attributes) { { category: { name: 'Shopping' }} }
    let(:invalid_attributes) { { category: { name: '' } } }
    let(:admin) { create :user, :admin_user }
    before { login_as admin }

    context 'when the record exists' do
      before { put_with_headers "/api/v0/categories/#{category_id}", valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request is invalid' do
      before { login_as admin }
      before { put_with_headers "/api/v0/categories/#{category_id}", invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"errors\":{\"name\":[\"can't be blank\"]}}")
      end
    end
  end
end
