class User < ApplicationRecord
  enum role: {
    user: 'user',
    admin: 'admin'
  }
end
