class User < ApplicationRecord
  validates :email, presence: true, length: { minimum: 3 }
end
