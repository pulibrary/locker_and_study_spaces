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

RSpec.describe '/locker_renewal_messages', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # ScheduledMessage. As you add validations to ScheduledMessage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      ScheduledMessage.create! valid_attributes
      get locker_renewal_messages_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      scheduled_message = ScheduledMessage.create! valid_attributes
      get locker_renewal_messages_url(scheduled_message)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      locker_renewal_message = ScheduledMessage.create! valid_attributes
      get edit_locker_renewal_message_url(locker_renewal_message)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ScheduledMessage' do
        expect do
          post new_locker_renewal_message_url, params: { locker_renewal_message: valid_attributes }
        end.to change(ScheduledMessage, :count).by(1)
      end

      it 'redirects to the created locker_renewal_message' do
        post new_locker_renewal_message_url, params: { locker_renewal_message: valid_attributes }
        expect(response).to redirect_to(locker_renewal_message_url(ScheduledMessage.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ScheduledMessage' do
        expect do
          post new_locker_renewal_message_url, params: { locker_renewal_message: invalid_attributes }
        end.to change(ScheduledMessage, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post new_locker_renewal_message_url, params: { locker_renewal_message: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested locker_renewal_message' do
        locker_renewal_message = ScheduledMessage.create! valid_attributes
        patch locker_renewal_message_url(locker_renewal_message), params: { locker_renewal_message: new_attributes }
        locker_renewal_message.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the locker_renewal_message' do
        locker_renewal_message = ScheduledMessage.create! valid_attributes
        patch locker_renewal_message_url(locker_renewal_message), params: { locker_renewal_message: new_attributes }
        locker_renewal_message.reload
        expect(response).to redirect_to(locker_renewal_message_url(locker_renewal_message))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        locker_renewal_message = ScheduledMessage.create! valid_attributes
        patch locker_renewal_message_url(locker_renewal_message), params: { locker_renewal_message: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested locker_renewal_message' do
      locker_renewal_message = ScheduledMessage.create! valid_attributes
      expect do
        delete locker_renewal_message_url(locker_renewal_message)
      end.to change(ScheduledMessage, :count).by(-1)
    end

    it 'redirects to the locker_renewal_messages list' do
      locker_renewal_message = ScheduledMessage.create! valid_attributes
      delete locker_renewal_message_url(locker_renewal_message)
      expect(response).to redirect_to(scheduled_meslocker_renewal)
    end
  end
end
