class CategoryPolicy < ApplicationPolicy
    class Scope
        def initialize(user, scope)
          @user  = user
          @scope = scope
        end

        def resolve
          if user && user.admin
            scope.all
          else
            scope.where(active: true)
          end
        end

        private

        attr_reader :user, :scope
      end
end
