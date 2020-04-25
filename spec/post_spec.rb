describe 'sign up' do
  it 'new user' do
    email = 'me@papito.io'
    Database.new.delete(email)
    result = HTTParty.post(
              'http://localhost:3000/user', 
              body: {
                full_name: "Fernando Papito",
                email: "#{email}",
                password: "jarvis123"
              }.to_json,
              headers: {
                'Content-Type' => 'application/json'
              }
            )
      ap result.to_h
      expect(result.response.code).to eql '200'
  end  
end
