class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def user_not_authorized(error)
      render json: { error: error.message }, status: :unauthorized
    end
end
