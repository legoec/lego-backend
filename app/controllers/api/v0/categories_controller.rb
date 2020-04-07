module Api
    module V0
        class CategoriesController < ApplicationController
            def index
                @categories = policy_scope(Category)
            end
        end
    end
end
