module Api
  module V0
      class RecomendationsController < ApplicationController

        before_action :authenticate_user!, only: [:create]

          def index
            @recomendations = Recomendation.includes(:user).where(service_id: params[:id])
          end

          def create
            @recomendation = Recomendation.new(recomendation_params)
            if @recomendation.save
              VendorMailer.with(vendor: @recomendation.service.vendor, recomendation: @recomendation).vendor_recomendation.deliver_later
              render :create, status: :created
            else
              render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @recomendation.errors }
            end
        end

        private
        def recomendation_params
          params.require(:recomendation).permit(
              :description,
              :ranking,
              :user_id,
              :service_id
          )
      end

      end
  end
end
