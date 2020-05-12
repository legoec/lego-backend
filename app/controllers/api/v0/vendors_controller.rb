module Api
  module V0
      class VendorsController < ApplicationController

          before_action :authenticate_user!, only: [:create, :show, :update]

          def create
              @vendor = Vendor.new(vendor_params)
              @vendor.user = @current_user
              if @vendor.save
                @vendor_request = VendorRequest.new(
                  status: 'pending',
                  feedback: '',
                  vendor: @vendor
                )
                if @vendor_request.save
                  render :create, status: :created
                else
                  render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @vendor_request.errors }
                end
              else
                render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @vendor.errors }
              end
          end

          def update
            @vendor = Vendor.find(params[:id])
            @vendor.user = @current_user
            if @vendor.update(vendor_params)
              @vendor_request = VendorRequest.new(
                status: 'pending',
                feedback: '',
                vendor: @vendor
              )
              if @vendor_request.save
                render :create, status: :ok
              else
                render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @vendor_request.errors }
              end
            else
              render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @vendor.errors }
            end
        end

          private
          def vendor_params
              params.permit(
                :ruc,
                :economic_activity,
                :contributor_type,
                :legal_representative,
                :business_name,
                :logo,
                :image,
                :slogan,
                :mobile,
                :active,
                :category_id,
              )
          end
      end
  end
end
