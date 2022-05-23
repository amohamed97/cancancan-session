# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, is_public: true

    return unless user.present?

    can :read, Post, is_approved: true
    can :manage, Post, user: user

    return unless user.is_admin?

    can :manage, Post
  end
end
