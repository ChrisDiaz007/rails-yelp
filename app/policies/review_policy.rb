class ReviewPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end
end
