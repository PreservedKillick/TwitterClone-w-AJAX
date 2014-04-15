# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    password "MyString"
    password_confirmation "MyString"
    handle "MyString"
    name "MyString"

    factory :bailey_user do
      email "bailey@chs.com"
      password "password"
      password_confirmation "password"
      handle "BaiBai"
      name "Bailey"
    end

  end
end
