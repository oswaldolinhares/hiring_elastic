# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Applicant management', :js do
  let!(:user) { create(:user) }

  before do
    driven_by(:selenium_chrome_headless)
    login_as(user)
  end

  def fill_in_salary_field(salary)
    salary_field = find_field('Salário')
    salary.to_s.chars.each do |char|
      salary_field.send_keys(char)
      sleep(0.1)
    end
  end

  context 'when creating a new applicant' do
    before do
      visit new_applicant_path
    end

    it 'calculates INSS contribution rate for a new applicant' do
      fill_in 'CPF', with: '12345678901'
      fill_in_salary_field(3000)

      expect(page).to have_field('inss_contribution_rate', with: 12, readonly: true)
    end

    it 'calculates salary deduction for a new applicant' do
      fill_in 'Nome', with: 'João da Silva'
      fill_in 'CPF', with: '12345678901'
      fill_in_salary_field(3000)

      expect(page).to have_field('salary_deduction', with: 281.62, readonly: true)
    end

    it 'submits the form successfully' do
      fill_in 'Nome', with: 'João da Silva'
      fill_in 'CPF', with: '12345678901'
      click_on('submit_button')

      expect(page).to have_content('O candidato foi criado com sucesso.')
    end
  end
end
