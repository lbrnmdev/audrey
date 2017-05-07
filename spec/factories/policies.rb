FactoryGirl.define do
  factory :policy do
    number "MyString"
    client nil
    type ""
    status 1
    issue_date "2017-05-07"
    start_date "2017-05-07"
    end_date "2017-05-07"
    premium "9.99"
    commission "9.99"
    discount "9.99"
  end
end
