module Api
    module V0
        class CategoriesController < ApplicationController
            def index
                @categories = Category.all
            end
        end
    end
end