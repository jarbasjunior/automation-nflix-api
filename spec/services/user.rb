class ApiUser
  include HTTParty
  base_uri 'http://localhost:3000'  
  headers 'Content-Type' => 'application/json'

  def self.token(user_email, user_password)
    result = post('/auth', body: { email: user_email, password: user_password }.to_json)
    "JWT #{result.parsed_response['token']}"
  end
  
  def self.save(user)
    post('/user', body: user.to_json)
  end

  def self.find(user_id, token)
    get("/user/#{user_id}", headers: { 'Authorization' => token })
  end
end
