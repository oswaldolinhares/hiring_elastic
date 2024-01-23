# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/applicants' do
  let(:valid_attributes) do
    attributes_for(:applicant)
  end

  let(:invalid_attributes) do
    attributes_for(:applicant).merge(cpf: nil)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Applicant.create! valid_attributes
      get applicants_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      applicant = Applicant.create! valid_attributes
      get applicant_url(applicant)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_applicant_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      applicant = Applicant.create! valid_attributes
      get edit_applicant_url(applicant)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Applicant' do
        expect do
          post applicants_url, params: { applicant: valid_attributes }
        end.to change(Applicant, :count).by(1)
      end

      it 'redirects to the created applicant' do
        post applicants_url, params: { applicant: valid_attributes }
        expect(response).to redirect_to(applicant_url(Applicant.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Applicant' do
        expect do
          post applicants_url, params: { applicant: invalid_attributes }
        end.not_to change(Applicant, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post applicants_url, params: { applicant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Godofredo Roberto' }
      end

      it 'updates the requested applicant' do
        applicant = Applicant.create! valid_attributes
        patch applicant_url(applicant), params: { applicant: new_attributes }
        applicant.reload
        expect(applicant.name).to eq('Godofredo Roberto')
      end

      it 'redirects to the applicant' do
        applicant = Applicant.create! valid_attributes
        patch applicant_url(applicant), params: { applicant: new_attributes }
        applicant.reload
        expect(response).to redirect_to(applicant_url(applicant))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        applicant = Applicant.create! valid_attributes
        patch applicant_url(applicant), params: { applicant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested applicant' do
      applicant = Applicant.create! valid_attributes
      expect do
        delete applicant_url(applicant)
      end.to change(Applicant, :count).by(-1)
    end

    it 'redirects to the applicants list' do
      applicant = Applicant.create! valid_attributes
      delete applicant_url(applicant)
      expect(response).to redirect_to(applicants_url)
    end
  end
end
