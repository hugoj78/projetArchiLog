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
    #raise
    true

    #record.user == user
    #record.id == tome_id
  end

  def update?
    edit?
  end

end
