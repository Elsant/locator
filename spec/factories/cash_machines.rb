FactoryBot.define do
  factory :cash_machine do
    sequence(:name) { |n| "ATM ##{n}" }
    # Moscow latitude range
    latitude  { Random.new.rand(55.559700 .. 55.913810) }
    # Moscow longitude range
    longitude { Random.new.rand(37.326050 .. 37.891850) }
  end
end
