describe 'delete' do
  context 'when a registered user' do
    let(:user) { build(:registered_user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiUser.remove(user.id, token) }
    
    it { expect(result.response.code).to eql '204' }
  end  
  
  context 'when not exists' do
    let(:user) { build(:registered_user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiUser.remove('0', token) }
    
    it { expect(result.response.code).to eql '404' }
  end

  context 'when wrong id' do
    let(:user) { build(:registered_user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiUser.remove('invalid123', token) }
    
    it { expect(result.response.code).to eql '412' }
  end
end