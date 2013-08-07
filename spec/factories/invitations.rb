# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    sent_by 1
    sent_to "MyText"
    sent_at "2013-06-24"
    accepted_at "2013-06-24"
    invite_token "MyText"
  end
end
