describe 'sign up' do
  context 'when I register a new user' do
    before do
      @new_user = build(:user).to_hash
      @result = ApiUser.save(@new_user)
    end
    
    it { expect(@result.response.code).to eql '200' }
  end

  context 'when wrong email' do
    before do
      @new_user = build(:user_worng_email).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' }
    it { expect(@result.parsed_response['msg']).to eql 'Oops. You entered a wrong email.' }
  end
end
