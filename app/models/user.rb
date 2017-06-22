class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy
  before_save { self.role ||= :standard}

  validates :password, presence: true
  validates :email, presence: true


  enum role: [:standard, :premium, :admin]

end
