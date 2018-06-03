class User < ApplicationRecord
  has_secure_password # <-- This is the new line
  has_many :groups
  has_many :outings
end
