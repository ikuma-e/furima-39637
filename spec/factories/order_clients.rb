FactoryBot.define do
  factory :order_client do
    post_code                  { '000-0000' }
    delivery_address_id        { Faker::Number.between(from: 2, to: 48) }
    city                       { Faker::Address.city }
    block                      { Faker::Address.street_address }
    build                      { Faker::Address.secondary_address }
    phone_num                  { Faker::Number.number(digits: 10) }
    token                      { "tok_abcdefghijk00000000000000000" }
  end
end
