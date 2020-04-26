module Api
    module V0
        class UsersController < ApplicationController
          before_action :authenticate_user!, only: [:index, :vendor]

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
        end
    end
end
