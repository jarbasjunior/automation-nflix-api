describe 'sign up' do
  context 'when I register a new user' do
    before do
      @new_user = { full_name: 'Fernando Papito', email: 'me@papito.io', password: 'jarvis123' }
      Database.new.delete(@new_user[:email])

      @result = HTTParty.post( 'http://localhost:3000/user', body: @new_user.to_json, headers: { 'Content-Type' => 'application/json' })
    end
    
    it { expect(@result.response.code).to eql '200' }
  end
end
