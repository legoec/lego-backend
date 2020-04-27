class VendorRequestPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.admin
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user && user.admin
        scope.all.group_by(&:vendor_id).map{|s| s.last.last}
      else
        []
      end
    end

    private

    attr_reader :user, :scope
  end
end
