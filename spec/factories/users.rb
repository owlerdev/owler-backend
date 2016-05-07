FactoryGirl.define do
  factory :user do
    email "example@email.wm.edu"
    password "password"
    password_confirmation "password"

    factory :another_user do
      email "person@email.wm.edu"
    end
  end
end
