FactoryBot.define do
  factory :user do
    nickname               { 'ロロロ' }
    email                  { 'hoge@email.com' }
    password               { '123456789a' }
    password_confirmation  { '123456789a' }
    first_name             { '山田' }
    family_name            { '太郎' }
    first_kana             { 'ヤマダ' }
    family_kana            { 'タロウ' }
    birthday               { '1999-6-6' }
  end
end
