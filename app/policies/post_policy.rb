class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        scope.where(is_public: true)
      end
    end
  end
end
