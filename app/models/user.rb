class User < ActiveRecord::Base

  has_secure_password

  has_many :rants

  def full_name
    "#{first_name} #{last_name}"
  end
  include Gravtastic
  gravtastic
end
