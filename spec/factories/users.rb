FactoryBot.define do 
  factory :user do
    japanese_user = Gimei.name
      
    nickname                  {Faker::Name.initials(number: 2)}
    email                     {Faker::Internet.email}
    password                  {Faker::Lorem.characters(min_alpha: 1, min_numeric: 1, number: 6..128)}
    password_confirmation     {password}
    family_name               {japanese_user.first.kanji}
    family_name_kana          {japanese_user.last.katakana}
    first_name                {japanese_user.first.kanji}
    first_name_kana           {japanese_user.first.katakana}
    user_birth                {Faker::Date.birthday}

  end
end
