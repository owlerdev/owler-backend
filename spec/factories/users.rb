FactoryGirl.define do
  factory :user do
    email "example@example.com"
    password "password"
    password_confirmation "password"
  end

  factory :another_user, class: User do
    email "person@website.com"
    password "abcdefgh"
    password_confirmation "abcdefgh"
  end
end
