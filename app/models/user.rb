class User < ApplicationRecord
  has_secure_password # <-- This is the new line
end
