class PostPolicy < ApplicationPolicy
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
