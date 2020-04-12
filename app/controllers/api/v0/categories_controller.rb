module Api
    module V0
        class CategoriesController < ApplicationController

            before_action :authenticate_user!, only: [:create, :show]
            before_action :find_category, except: [:index, :create]

            def index
                @categories = policy_scope(Category)
            end

            def create
                category = Category.new(category_params)
                authorize category
                if category.save
                  render json: { category: category },
                        status: :created
                else
                  render json: category.errors,
                        status: :unprocessable_entity
                end
            end

            def show
              authorize @category
            end

            def update
              if !@category.update(category_params)
                render json: @category.errors,
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

            def find_category
              @category = Category.find(params[:id])
            end
        end
    end
end
