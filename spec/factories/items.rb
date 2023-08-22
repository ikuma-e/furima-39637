FactoryBot.define do
  factory :item do
    
    item_name                  {Faker::Commerce.product_name}
    description                {Faker::Lorem.sentence}
    price                      {Faker::Commerce.price(range: 300..9999999)}
    category_id                {Faker::Number.between(from: 2, to: 11)}
    state_id                   {Faker::Number.between(from: 2, to: 7)}
    delivery_price_id          {Faker::Number.between(from: 2, to: 3)}
    delivery_address_id        {Faker::Number.between(from: 2, to: 48)}
    delivery_time_id           {Faker::Number.between(from: 2, to: 4)}
    
    # イメージはassetsフォルダから持ってくる
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    # ユーザーのデータと紐付け
    association :user

  end
end