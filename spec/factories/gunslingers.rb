# frozen_string_literal: true

FactoryBot.define do
  factory :gunslinger do
    email { Forgery::Internet.email_address }
    first_name { Forgery::Name.first_name }
    last_name { Forgery::Name.last_name }
    acclaimed false
  end
end
