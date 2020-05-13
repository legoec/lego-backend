module Api
  module V0
    class ServicesController < ApplicationController
      before_action :authenticate_user!, only: [:create]

      def index
        @services = Service.includes(:vendor).where(vendors: {category_id: params[:id]})
      end

      def create
        @service = Service.new(service_params)
        if @service.save
          render :create, status: :created
        else
          render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @service.errors }
        end
      end

      private
      def service_params
        params.require(:service).permit(
          :name,
          :price,
          :amount,
          :vendor_id
        )
      end
    end
  end
end
