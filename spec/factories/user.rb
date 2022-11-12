FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { password }
    last_name             { 'テスト苗字' }
    first_name            { 'テスト名前' }
    last_name_kana        { 'テストミョウジ' }
    first_name_kana       { 'テストナマエ' }
    birthday              { '2000-01-01' }
  end
end
