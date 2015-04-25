class UserPolicy < ApplicationPolicy

  def index?
    user.present? && user.author?
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
