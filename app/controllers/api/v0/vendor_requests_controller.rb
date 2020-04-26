module Api
  module V0
    class VendorRequestsController < ApplicationController
      before_action :authenticate_user!, only: [:create]

      def create
        @vendor_request = VendorRequest.new(vendor_request_params)
        if @vendor_request.save
          render :create, status: :created
        else
          render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @vendor_request.errors }
        end
      end

      private
      def vendor_request_params
        params.require(:vendor_request).permit(
          :status,
          :feedback,
          :vendor_id
        )
      end
    end
  end
end
