# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applicant do
  describe 'validations' do
    context 'when CPF is not present' do
      let(:applicant) { described_class.new(cpf: nil) }

      it 'is not valid without a CPF' do
        expect(applicant).not_to be_valid
      end

      it 'adds an error for missing CPF' do
        applicant.valid?
        expect(applicant.errors[:cpf]).to include('não pode ficar em branco')
      end
    end

    context 'when CPF is not unique' do
      before { described_class.create!(cpf: '12345678901') }

      let(:new_applicant) { described_class.new(cpf: '12345678901') }

      it 'is not valid with a duplicate CPF' do
        expect(new_applicant).not_to be_valid
      end

      it 'adds an error for duplicate CPF' do
        new_applicant.valid?
        expect(new_applicant.errors[:cpf]).to include('já está em uso')
      end
    end
  end

  describe '.calculate_inss' do
    context 'when salary is 3000' do
      let(:salary) { 3000 }

      it 'calculates the correct INSS deduction' do
        result = described_class.calculate_inss(salary)
        expect(result[:deduction]).to eq(281.62)
      end

      it 'calculates the correct INSS rate' do
        result = described_class.calculate_inss(salary)
        expect(result[:rate]).to eq(12)
      end
    end
  end
end
