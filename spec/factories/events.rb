FactoryGirl.define do
  factory :event do
    address "999 Jamestown Road"
    description "Awesome party. Please come."
    name "The Best Party of the Semester"
    start_t "2016-01-31 13:25:23"
    end_t "2016-01-31 13:25:23"
    posted false
    update_code "ABCDEF"
  end

  factory :another_event, class: Event do
    address "999 Jamestown Road"
    description "My party is the coolest."
    name "The Actual Best Party"
    start_t "2016-01-31 13:25:23"
    end_t "2016-01-31 13:25:23"
    posted false
    update_code "123456"
  end
end