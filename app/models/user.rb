class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  has_many :articles, dependent: :destroy
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  def assign_default_role
    self.add_role(:reader) if self.roles.blank?
  end
end
