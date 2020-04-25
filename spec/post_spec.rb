describe 'post' do
  context 'when register a new user' do
    let(:result) { ApiUser.save(build(:user).to_hash) }
    it { expect(result.response.code).to eql '200' }
  end

  context 'when wrong email' do
    let(:result) { ApiUser.save(build(:user_wrong_email).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Oops. You entered a wrong email.' }
  end

  context 'when empty name' do
    let(:result) { ApiUser.save(build(:user_empty_name).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Validation notEmpty on full_name failed' }
  end  
  
  context 'when empty email' do
    let(:result) { ApiUser.save(build(:user_empty_email).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Validation notEmpty on email failed' }
  end
  
  context 'when empty password' do
    let(:result) { ApiUser.save(build(:user_empty_password).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Validation notEmpty on password failed' }
  end
  
  context 'when duplicated email' do
    let(:result) { ApiUser.save(build(:registered_user).to_hash) }
    it { expect(result.response.code).to eql '409' }
    it { expect(result.parsed_response['msg']).to eql 'Oops. Looks like you already have an account with this email address.' }
  end
  
  
  context 'when name is null' do
    let(:result) { ApiUser.save(build(:user_name_is_null).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Users.full_name cannot be null' }
  end  
  
  context 'when email is null' do
    let(:result) { ApiUser.save(build(:user_email_is_null).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Users.email cannot be null' }
  end
  
  context 'when password is null' do
    let(:result) { ApiUser.save(build(:user_password_is_null).to_hash) }
    it { expect(result.response.code).to eql '412' }
    it { expect(result.parsed_response['msg']).to eql 'Users.password cannot be null' }
  end
end
