class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.has_role? :admin
        can :crud, :all
    else
        can :read, :all
        can :create
    end
  end
end
