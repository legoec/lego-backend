module Api
  module V0
    class VendorServicesController < ApplicationController
      before_action :authenticate_user!, only: [:index]

      def index
        @services = Service.where(vendor_id: params[:id])
      end
    end
  end
end
