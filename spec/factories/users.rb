# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    password_digest "MyString"
    handle "MyString"
    name "MyString"

    factory :bailey_user do
      email "bailey@chs.com"
      password_digest "password"
      handle "BaiBai"
      name "Bailey"
    end

  end
end
