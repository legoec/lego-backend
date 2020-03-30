# spec/integration/users_spec.rb
require 'swagger_helper'

describe 'Users API' do

  path '/api/v0/users' do

    get 'get all users' do
      tags 'Users'
      consumes 'application/json', 'application/xml'

      response '200', 'list of users' do
        run_test!
      end
    end
  end
end