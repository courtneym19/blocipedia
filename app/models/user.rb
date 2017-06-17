class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  before_save { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]

  def standard?
    self.role == 'standard'
  end

  def premium?
    self.role == 'premium'
  end

  def admin?
    self.role == 'admin'
  end

  def upgrade
    self.role = 'premium'
    self.save!
  end

  def downgrade
    self.role = 'standard'
    self.save!
  end



end
