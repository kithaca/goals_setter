FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password Faker::Internet.password
    # password_digest BCrypt::Password.create()
    # session_token SecureRandom.urlsafe_base64
  end

end
