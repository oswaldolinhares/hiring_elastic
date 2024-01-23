# frozen_string_literal: true

FactoryBot.define do
  factory :applicant do
    name { Faker::Name.name }
    cpf { Faker::Number.unique.number(digits: 11) }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%Y-%m-%d') }
    address { Faker::Address.street_address }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip_code }
    phone { Faker::PhoneNumber.cell_phone }
    salary { 9580.00 }
    inss_contribution_rate { 12 }
    salary_deduction { 300 }
  end
end
