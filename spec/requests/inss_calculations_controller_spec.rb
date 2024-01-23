# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InssCalculationsController do
  describe 'POST #calculate' do
    context 'when salary is 3000' do
      before do
        post '/calculate_inss', params: { salary: 3000 }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the correct INSS rate for a salary of 3000' do
        expect(json_body[:rate]).to eq(12)
      end

      it 'returns the correct INSS deduction for a salary of 3000' do
        expect(json_body[:deduction]).to eq(281.62)
      end
    end
  end
end
