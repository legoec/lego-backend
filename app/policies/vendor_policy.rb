class VendorPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.admin
  end

  def show?
    @user.admin
  end

  def update?
    @user.admin
  end


  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user && user.admin
        scope.all
      else
        scope.joins(:vendor_requests).where(vendor_requests: {status: "approved"})
      end
    end

    private

    attr_reader :user, :scope
  end
end
