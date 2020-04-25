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
  
  factory :user_worng_email, class: UserModel do
    full_name { 'Fernando Papito' }
    email { 'www.papito.com.br' }
    password { 'jarvis123' }
  end
end
