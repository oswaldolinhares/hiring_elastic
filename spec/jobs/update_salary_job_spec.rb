# spec/jobs/update_salary_job_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateSalaryJob do
  include ActiveJob::TestHelper

  let(:applicant) do
    Applicant.create!(cpf: '12345678901', salary: 2000.00, name: 'Test Applicant',
                      birth_date: '1990-01-01', address: 'Test Address', number: '123',
                      neighborhood: 'Test Neighborhood', city: 'Test City', state: 'TS',
                      zip: '12345', phone: '1234567890')
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  describe '#perform' do
    let(:new_salary) { 7000.00 }
    let(:inss_data) { Applicant.calculate_inss(new_salary) }

    before do
      described_class.perform_now(applicant.id, new_salary)
      applicant.reload
    end

    it 'updates the salary of the applicant' do
      expect(applicant.salary).to eq(new_salary)
    end

    it 'updates the INSS contribution rate' do
      expect(applicant.inss_contribution_rate).to eq(inss_data[:rate])
    end

    it 'updates the salary deduction' do
      expect(applicant.salary_deduction).to eq(inss_data[:deduction])
    end
  end
end
