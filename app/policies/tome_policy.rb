class TomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
  	true
  end
  def new?
    user.admin == true
  end
  def create?
    new?
  end

  def edit?
    user.admin == true
  end

  def update?
    edit?
  end

  def destroy?
    user.admin == true
  end
end
