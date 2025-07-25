class RestaurantPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    return user.admin? || record.user == user
  end

  def destroy?
    return user.admin? || record.user == user
  end

end
