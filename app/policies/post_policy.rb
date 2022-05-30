class PostPolicy < ApplicationPolicy
  def show?
    Scope.new(user, Post).resolve.find_by_id(record.id).present?
  end

  def update?
    record.user == user
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      return scope.where(is_public: true) if user.nil?

      if user.is_admin?
        scope.all
      else
        scope.where("is_public = ? or is_approved = ?", true, true)
      end
    end
  end
end
