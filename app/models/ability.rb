class Ability
  include CanCan::Ability


  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role) }

    if @user.roles.size == 0
#      can :read, :all #for guest without roles
    end
	if user.admin?
		can :manage, :all
	elsif user.recruiter
		can :manage, :enquiry
		can :manage, :reply

		can :read, :category
		can :read, :provider
		can :read, :price
		can :read, :skill
		can :read, :rate
	elsif user.provider
		can :read, :all    
	end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
