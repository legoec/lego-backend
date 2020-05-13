module Api
    module V0
        class CategoriesController < ApplicationController

            before_action :authenticate_user!, only: [:create, :update]
            before_action :find_category, except: [:index, :create]

            def index
                @categories = policy_scope(Category)
            end

            def create
                @category = Category.new(category_params)
                authorize @category
                if @category.save
                  render :create, status: :created
                else
                  render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @category.errors }
                end
            end

            def show
            end

            def update
              if !@category.update(category_params)
                render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @category.errors }
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
