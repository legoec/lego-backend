module Api
    module V0
        class CategoriesController < ApplicationController

            before_action :authenticate_user!, only: [:create, :show, :update]
            before_action :find_category, except: [:index, :create]

            def index
                @categories = policy_scope(Category)
            end

            def create
                @category = Category.new(category_params)
                authorize @category
                if @category.save
                  render :create, status: 201
                else
                  render json: @category.errors,
                        status: :unprocessable_entity
                end
            end

            def show
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
              authorize @category
            end
        end
    end
end
