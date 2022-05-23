# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Post, is_public: true

    return unless user.is_admin?

    can :manage, Post
  end
end
