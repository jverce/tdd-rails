class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  def email_domain
    Mail::Address.new(email).domain
  end
end
