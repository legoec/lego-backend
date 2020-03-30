# spec/integration/auth_spec.rb
require 'swagger_helper'

describe 'Auth API' do

  path '/api/v0/auth' do

    post 'Creates a user' do
        tags 'Auth'
        consumes 'application/json', 'application/xml'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string },
            password: { type: :string }
          },
          required: [ 'name', 'email', 'password' ]
        }

        response '200', 'user created' do
          let(:user) { { name: 'Dodo', email: 'available@available.com', password: 'password' } }
          run_test!
        end

        response '422', 'error creating user' do
          let(:user) { { name: 'Dodo', email: 'available@available.com' } }
          run_test!
        end
      end
  end
end