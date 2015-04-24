class UserPolicy < ApplicationPolicy

  def index?
    user.author?
  end

  def update?
    index?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

end
