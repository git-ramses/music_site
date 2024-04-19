require "rails_helper"

RSpec.describe User do
  describe 'validations' do
    let(:user) { User.new(username: username, password: password) }
    let(:username) { "testUser" }
    let(:password) { "1234" }

    context 'when username missing' do
      let(:username) { nil }
      
      it 'is invalid' do
        expect(user).not_to be_valid
      end
    end

    context 'when password missing' do
      let(:password) { nil }

      it 'is invalid' do
        expect(user).not_to be_valid
      end
    end

    context 'when valid attributes' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end
  end
end