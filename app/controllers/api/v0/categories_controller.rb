module Api
    module V0
        class CategoriesController < ApplicationController
            def index
                @categories = policy_scope(Category)
            end

            def create
                category = Category.new(category_params)
                if category.save
                  render json: { category: category },
                        status: :created
                else
                  render json: category.errors,
                        status: :unprocessable_entity
                end
            end

            private
            def category_params
                params.require(:category).permit(
                    :name,
                    :percentage,
                    :active
                )
            end
        end
    end
end
