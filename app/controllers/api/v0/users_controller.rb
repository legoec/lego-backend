module Api
    module V0
        class UsersController < ApplicationController
          before_action :authenticate_user!, only: [:index, :vendor, :update]
          before_action :find_user, only: [:update]

          def index
              @users = User.all
          end

          def vendor
            @vendor_request = VendorRequest.joins(:vendor).where('vendors.user_id = ?', current_user.id).last
            if @vendor_request
              render :vendor
            else
              # render an empty object to evaluate on frontend
              render json: {}
            end
          end

          def update
            if !@user.update(user_params)
              render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @user.errors }
            end
          end

          private
          def user_params
            params.require(:user).permit(
              :name,
              :nickname,
              :email
            )
          end

          def find_user
            @user = User.find(params[:id])
          end
        end
    end
end
