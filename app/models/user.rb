class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos
  has_many :user_roles

  def admin?
  	if self.role = 'admin'
  		true
  	else
  		false
  	end
  end
end
