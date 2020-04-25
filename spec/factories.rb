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

  factory :registered_user, class: UserModel do
    full_name { 'Fernando Papito' }
    email { 'he@papito.io' }
    password { '123456' }

    after(:build) do |user|
      Database.new.delete(user.email)
      ApiUser.save(user.to_hash)
    end
  end
  
  factory :user_wrong_email, class: UserModel do
    full_name { 'Fernando Papito' }
    email { 'www.papito.com.br' }
    password { 'jarvis123' }
  end

  factory :user_empty_name, class: UserModel do
    full_name { '' }
    email { 'me@papito.io' }
    password { 'jarvis123' }
  end

  factory :user_empty_email, class: UserModel do
    full_name { 'Fernando Papito' }
    email { '' }
    password { 'jarvis123' }
  end

  factory :user_empty_password, class: UserModel do
    full_name { 'Fernando Papito' }
    email { 'me@papito.io' }
    password { '' }
  end

  factory :user_name_is_null, class: UserModel do
    email { 'me@papito.io' }
    password { '123456' }
  end
 
  factory :user_email_is_null, class: UserModel do
    full_name { 'Fernando Papito' }
    password { '123456' }
  end
   
  factory :user_password_is_null, class: UserModel do
    full_name { 'Fernando Papito' }
    email { 'me@papito.io' }
  end
end
