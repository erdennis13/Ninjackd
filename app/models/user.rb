class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_many :workouts, :through => :subscriptions
  has_many :likes
  has_many :workouts, :through => :likes
  has_many :comments
  has_many :users, :through => :comments

  accepts_nested_attributes_for :subscriptions

  validates_presence_of :name, :username
  validates_uniqueness_of :username, :email
end
