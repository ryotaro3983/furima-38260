FactoryBot.define do
  factory :item do
    name      {'sample'}
    text      {'hogefuga'}
    category_id {2}
    condition_id  {2}
    delivery_fee_id {2}
    prefecture_id {2}
    delivery_day_id {2}
    price     {3000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end

    association :user
  end
end
