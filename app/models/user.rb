# app/models/user.rb

class User < ApplicationRecord
  # other Devise modules...

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Remove any attr_accessor for name, profile, occupation, position if present
end

