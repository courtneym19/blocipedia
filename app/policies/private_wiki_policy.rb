class PrivateWikiPolicy < ApplicationPolicy
  attr_reader :user, :private_wiki

  def initialize(user, private_wiki)
    @user = user
    @private_wiki = private_wiki
  end

  def show?
    user.role? :premium or user.role? :admin
  end
end
