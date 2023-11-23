# app/models/user.rb

class User < ApplicationRecord
  # other Devise modules...

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototypes

  # Remove any attr_accessor for name, profile, occupation, position if present
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
end

