class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? && user.author?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.author?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end


end
