describe 'put' do
  context 'when register a new user' do
    before(:all) do
      user = build(:registered_user)
      token = ApiUser.token(user.email, user.password)
      @new_user = build(:user)
      @result = ApiUser.update(user.id, token, @new_user.to_hash)
      @result_get = ApiUser.find(user.id, token)
    end

    it { expect(@result.response.code).to eql '200' }
    it { expect(@result_get.parsed_response['full_name']).to eql @new_user.full_name }
    it { expect(@result_get.parsed_response['email']).to eql @new_user.email }
  end
end