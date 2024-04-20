require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { instance_double(User, username: 'testUser') }

  before { allow(User).to receive(:find).and_return(user) }

  describe '#show' do
    it 'sets a page title and renders the show template' do
      get :show, params: { id: 1 }

      expect(assigns(:page_title)).to eq('testUser\'s Profile')
      expect(response).to render_template(:show)
    end
  end

  describe '#edit' do
    it 'sets a page title and renders the edit template' do
      get :edit, params: { id: 1 }

      expect(assigns(:page_title)).to eq('Editing testUser\'s Profile')
      expect(response).to render_template(:edit) 
    end
  end

  describe '#update' do
    let(:params) do
      {
        id: 1,
        user: {
          genre: 'Experimental'
        }
      }
    end

    context 'when update succeeds' do
      it 'updates the user and redirects to the show path' do
        expect(user).to receive(:update).and_return(true)

        patch :update, params: params

        expect(flash[:success]).to eq('User updated!')
        expect(response).to redirect_to user_path(user)
      end
    end

    context 'when update fails' do
      it 'flashes an error and redirects to the edit path' do
        expect(user).to receive(:update).and_return(false)
        expect(user).to receive_message_chain(:errors, :full_messages, :join).and_return('some error')

        patch :update, params: params

        expect(flash[:error]).to eq('some error')
        expect(response).to redirect_to edit_user_path(user)
      end
    end
  end
end