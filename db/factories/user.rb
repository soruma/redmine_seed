FactoryBot.define do
  factory :dev_user, class: User do
    sequence(:login) { |i| "user#{i}" }
    sequence(:mail) { |i| "user#{i}@example.com" }

    sequence(:firstname) { |i| "first#{i}" }
    sequence(:lastname) { |i| "last#{i}" }
    password { 'password' }

    to_create do |instance|
      instance.save validate: false
    end
  end
end
