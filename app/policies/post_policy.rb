class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(is_public: true)
    end
  end
end
