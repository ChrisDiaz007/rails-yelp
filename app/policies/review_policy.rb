class ReviewPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def new?
    return create?
  end

  def create?
    user.present? && record.restaurant.user != user
  end
end
