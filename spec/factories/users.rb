FactoryBot.define do

  factory :user do
    first_name            {"けけけ"}
    first_name_kana       {"カタカナ"}
    last_name             {"けけけ"}
    last_name_kana        {"カタカナ"}
    nickname              {"abe"}
    birthday              {"1930-01-01"}
    email                 {"kkk@email.com"}
    password              {"00000000a"}
    password_confirmation {"00000000a"}
  end
end