module Api
    module V0
        class UsersController < ApplicationController
            def index
                @users = User.all
            end
        end
    end
end