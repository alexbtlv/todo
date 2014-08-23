class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos
  has_many :user_roles

  before_create :downcase_name, :downcase_email

  def to_param
    name
  end

  def downcase_name
    self.name = name.downcase
  end

  def downcase_email
    self.email = email.downcase
  end

  def admin?
  	if self.role = 'admin'
  		true
  	else
  		false
  	end
  end
end
