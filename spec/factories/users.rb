FactoryGirl.define do
  factory :user do
    email "example@example.com"
    password "password"
    password_confirmation "password"

    factory :another_user do
      email "person@website.com"
    end
  end
end
