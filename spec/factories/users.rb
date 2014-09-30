# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name "Obama"
  	email "codecedemy@todo.com"
  	password "1234567890"
  	password_confirmation "1234567890"
  end
end
