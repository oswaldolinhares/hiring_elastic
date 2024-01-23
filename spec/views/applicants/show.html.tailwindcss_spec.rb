# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/show' do
  let(:applicant) do
    Applicant.create!(
      name: 'Name',
      cpf: 'Cpf',
      address: 'Address',
      number: 'Number',
      neighborhood: 'Neighborhood',
      city: 'City',
      state: 'State',
      zip: 'Zip',
      phone: 'Phone',
      salary: '91.99',
      inss_contribution_rate: '92.99',
      salary_deduction: '93.99'
    )
  end

  before do
    assign(:applicant, applicant)
    render
  end

  context 'when displaying Personal Information' do
    it 'renders the applicant name' do
      expect(rendered).to match(/Name/)
    end

    it 'renders the applicant CPF' do
      expect(rendered).to match(/Cpf/)
    end
  end

  context 'when displaying Address Information' do
    it 'renders the applicant address' do
      expect(rendered).to match(/Address/)
    end

    it 'renders the applicant number' do
      expect(rendered).to match(/Number/)
    end

    it 'renders the applicant neighborhood' do
      expect(rendered).to match(/Neighborhood/)
    end

    it 'renders the applicant city' do
      expect(rendered).to match(/City/)
    end

    it 'renders the applicant state' do
      expect(rendered).to match(/State/)
    end

    it 'renders the applicant zip' do
      expect(rendered).to match(/Zip/)
    end

    it 'renders the applicant phone' do
      expect(rendered).to match(/Phone/)
    end
  end

  context 'when displaying Financial Information' do
    it 'renders the applicant salary' do
      expect(rendered).to match(/91.99/)
    end

    it 'renders the applicant inss_contribution_rate' do
      expect(rendered).to match(/92.99/)
    end

    it 'renders the applicant salary_deduction' do
      expect(rendered).to match(/93.99/)
    end
  end
end
