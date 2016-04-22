FactoryGirl.define do
  factory :event do
    user
    address "903 Jamestown Road, Williamsburg, VA 23185"
    lat 37.265369
    lng -76.719661
    description "Awesome party. Please come."
    name "The Best Party of the Semester"
    start_t "2016-01-31 13:25:23"
    posted false

    factory :another_event do
      association :user, factory: :another_user
      address "901 Jamestown Road, Williamsburg, VA 23185"
      lat 37.265369
      lng -76.719661
      description "My party is the coolest."
      name "The Actual Best Party"
    end

    factory :future_event do
      association :user, factory: :another_user
      address "903 Jamestown Road, Williamsburg, VA 23185"
      lat 37.265369
      lng -76.719661
      description "My party is the coolest."
      name "The Best Party in the future"
      start_t "2090-01-31 13:30:00"
      end_t "2090-01-31 15:30:00"
    end
  end

end
