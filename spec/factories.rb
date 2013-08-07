FactoryGirl.define do 
  factory :user do
	sequence(:email) { |n| "foo#{n}@example.com" }
	sequence(:name) { |n| "female#{n}" }
	password "99secrets"
	password_confirmation "99secrets"
end
end

# OLD

# FactoryGirl.define do 
#   factory :user do
# 	sequence(:email) { |n| "foo#{n}@example.com" }
# 	sequence(:name) { |n| "female#{n}" }
# 	password "99secrets"
# 	password_confirmation "99secrets"
# end
# end