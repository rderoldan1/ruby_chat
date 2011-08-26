class Company < ActiveRecord::Base
  PRICES = [
    "$3,000 and under", "$3,000-$10,000",
    "$10,000-$25,000", "$25,000-$50,000",
    "over $50,000"
    ]
end
