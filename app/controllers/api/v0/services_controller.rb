module Api
  module V0
      class ServicesController < ApplicationController

          def index
              @services = Service.includes(:vendor).where(vendors: {category_id: params[:id]})
          end

      end
  end
end
