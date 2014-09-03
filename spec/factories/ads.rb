# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ad do
    user_id 1
    link "MyString"
    repost "2014-08-27 23:06:16"
    done false
  end
end
