# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/lockers', type: :request do
  let(:user) { FactoryBot.create :user }
  before do
    sign_in user
  end

  # Locker. As you add validations to Locker, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { size: 4, location: 'A-1-100', general_area: 'A-1', accessible: false, notes: 'MyString',
      combination: '11-22-33', code: 'code', tag: 'tag', discs: 'disc', clutch: 'clutch',
      hubpos: 'hub', key_number: 'key', floor: 1 }
  end

  let(:invalid_attributes) do
    { size: 4, location: nil, general_area: nil, accessible: false, notes: 'MyString',
      combination: '11-22-33', code: 'code', tag: 'tag', discs: 'disc', clutch: 'clutch',
      hubpos: 'hub', key_number: 'key', floor: 1 }
  end

  describe 'GET /index' do
    it 'redirects to root' do
      Locker.create! valid_attributes
      get lockers_url
      expect(response).to be_redirect
    end
  end

  describe 'GET /show' do
    it 'redirects to root' do
      locker = Locker.create! valid_attributes
      get locker_url(locker)
      expect(response).to be_redirect
    end
  end

  describe 'GET /new' do
    it 'redirects to root' do
      get new_locker_url
      expect(response).to be_redirect
    end
  end

  describe 'GET /edit' do
    it 'redirects to root' do
      locker = Locker.create! valid_attributes
      get edit_locker_url(locker)
      expect(response).to be_redirect
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'redirects to root' do
        expect do
          post lockers_url, params: { locker: valid_attributes }
        end.to change(Locker, :count).by(0)
        expect(response).to be_redirect
      end

      it 'redirects to the root path' do
        post lockers_url, params: { locker: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Locker' do
        expect do
          post lockers_url, params: { locker: invalid_attributes }
        end.to change(Locker, :count).by(0)
      end

      it 'redirects to root path' do
        post lockers_url, params: { locker: invalid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { size: 4, location: 'A-1-101', general_area: 'A-1', accessible: false, notes: 'MyString',
          combination: '12-23-34', code: 'code', tag: 'tag', discs: 'disc', clutch: 'clutch',
          hubpos: 'hub', key_number: 'key', floor: 1 }
      end

      it 'does not change the object' do
        locker = Locker.create! valid_attributes
        patch locker_url(locker), params: { locker: new_attributes }
        locker.reload
        expect(locker.location).to eq('A-1-100')
        expect(locker.combination).to eq('11-22-33')
      end

      it 'redirects to the root path' do
        locker = Locker.create! valid_attributes
        patch locker_url(locker), params: { locker: new_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'redirects to root path' do
        locker = Locker.create! valid_attributes
        patch locker_url(locker), params: { locker: invalid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'does not destroy the item' do
      locker = Locker.create! valid_attributes
      expect do
        delete locker_url(locker)
      end.to change(Locker, :count).by(0)
    end

    it 'redirects to the lockers list' do
      locker = Locker.create! valid_attributes
      delete locker_url(locker)
      expect(response).to redirect_to(root_path)
    end
  end

  context 'with an admin user' do
    let(:user) { FactoryBot.create :user, :admin }

    describe 'GET /index' do
      it 'renders a successful response' do
        Locker.create! valid_attributes
        get lockers_url
        expect(response).to be_successful
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        locker = Locker.create! valid_attributes
        get locker_url(locker)
        expect(response).to be_successful
      end
    end

    describe 'GET /new' do
      it 'renders a successful response' do
        get new_locker_url
        expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'render a successful response' do
        locker = Locker.create! valid_attributes
        get edit_locker_url(locker)
        expect(response).to be_successful
      end
    end

    describe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new Locker' do
          expect do
            post lockers_url, params: { locker: valid_attributes }
          end.to change(Locker, :count).by(1)
        end

        it 'redirects to the created locker' do
          post lockers_url, params: { locker: valid_attributes }
          expect(response).to redirect_to(locker_url(Locker.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Locker' do
          expect do
            post lockers_url, params: { locker: invalid_attributes }
          end.to change(Locker, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post lockers_url, params: { locker: invalid_attributes }
          expect(response).to be_unprocessable
        end
      end
    end

    describe 'PATCH /update' do
      context 'with valid parameters' do
        let(:new_attributes) do
          { size: 4, location: 'A-1-101', general_area: 'A-1', accessible: false, notes: 'MyString',
            combination: '12-23-34', code: 'code', tag: 'tag', discs: 'disc', clutch: 'clutch',
            hubpos: 'hub', key_number: 'key', floor: 1 }
        end

        it 'updates the requested locker' do
          locker = Locker.create! valid_attributes
          patch locker_url(locker), params: { locker: new_attributes }
          locker.reload
          expect(locker.location).to eq('A-1-101')
          expect(locker.combination).to eq('12-23-34')
        end

        it 'redirects to the locker' do
          locker = Locker.create! valid_attributes
          patch locker_url(locker), params: { locker: new_attributes }
          locker.reload
          expect(response).to redirect_to(locker_url(locker))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          locker = Locker.create! valid_attributes
          patch locker_url(locker), params: { locker: invalid_attributes }
          expect(response).to be_unprocessable
          locker.reload
          expect(locker.location).to eq('A-1-100')
          expect(locker.combination).to eq('11-22-33')
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'destroys the requested locker' do
        locker = Locker.create! valid_attributes
        expect do
          delete locker_url(locker)
        end.to change(Locker, :count).by(-1)
      end

      it 'redirects to the lockers list' do
        locker = Locker.create! valid_attributes
        delete locker_url(locker)
        expect(response).to redirect_to(lockers_path)
      end
    end
  end
end
