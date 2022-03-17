FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name }
    email                 {Faker::Internet.free_email}
    #password              {Faker::Internet.password(min_length: 6)}
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}

    transient do
      person { Gimei.name }      
    end
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name { person.last.katakana }
    first_name { person.first.katakana }

    birth_date {Faker::Date.birthday}
    
  end
end