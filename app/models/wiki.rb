class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  before_save { self.private ||= :false}

  default_scope { order('updated_at DESC') }

  def collaborator_for(user)
   collaborators.where(user_id: user.id)
  end

end
