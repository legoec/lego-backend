module Api
  module V0
    class VendorsController < ApplicationController
      before_action :authenticate_user!, only: [:show]
      before_action :find_vendor, only: [:show]

      def index
        @vendors = policy_scope(Vendor)
      end

      private
      def vendor_params
        params.require(:vendor).permit(
          :id,
          :ruc,
          :business_name,
          :legal_representative,
          :category_id,
          :mobile
        )
      end

      def find_vendor
        @vendor = Vendor.find(params[:id])
        authorize @vendor
      end
    end
  end
end
