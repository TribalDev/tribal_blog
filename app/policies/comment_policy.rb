class CommentPolicy < ApplicationPolicy

  def index?
    true
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