module Api
  module V0
    class ServicesController < ApplicationController
      before_action :authenticate_user!, only: [:create]
      before_action :find_service, except: [:index, :create]

      PAGE = 1
      PER_PAGE = 10

      def index
        query = params[:query]
        @services = Service.includes(:vendor)
                           .where(vendors: {category_id: params[:id]})
                           .where("unaccent(services.name) ILIKE :q OR unaccent(vendors.business_name) ILIKE :q", q: "%#{query}%")
                           .page(params[:page] || PAGE)
                           .per(params[:per_page] || PER_PAGE)
        @total_count = @services.total_count
      end

      def show
      end

      def update
        if !@service.update(service_params)
          render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @category.errors }
        end
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

      def find_service
        @service = Service.find(params[:id])
      end
    end
  end
end
