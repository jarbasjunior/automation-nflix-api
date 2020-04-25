require_relative 'models/user_model'

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { 'Fernando Papito' }
    email { 'me@papito.io' }
    password { 'jarvis123' }

    after(:build) do |user|
      Database.new.delete(user.email)
    end
  end
end
