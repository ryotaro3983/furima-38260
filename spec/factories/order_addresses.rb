FactoryBot.define do
  factory :order_address do
    token           { 'tok_abcdefghijk00000000000000000' }
    postal_code     { '000-1111' }
    prefecture_id   { 2 }
    city            { 'あああ' }
    house_number    { 'いいい' }
    building        { 'ううう' }
    phone_number    { '09011112222' }

    association :user
    association :item
  end
end
