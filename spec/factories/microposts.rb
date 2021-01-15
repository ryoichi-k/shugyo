FactoryBot.define do
  factory :micropost do
    contents { "micropost test" }
    user
  end
end