if Rails.env.development?
  10.times { FactoryBot.create(:cash_machine) }
end