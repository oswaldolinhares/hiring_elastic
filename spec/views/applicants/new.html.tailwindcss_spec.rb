# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/new' do
  before do
    assign(:applicant, Applicant.new)
    render
  end

  context 'when rendering the new applicant form' do
    it 'renders the form with correct action and method' do
      assert_select 'form[action=?][method=?]', applicants_path, 'post'
    end
  end

  context 'when displaying Personal Information' do
    it 'renders the name input field' do
      assert_input_field('applicant[name]')
    end

    it 'renders the cpf input field' do
      assert_input_field('applicant[cpf]')
    end
  end

  context 'when displaying Address Information' do
    it 'renders the address input field' do
      assert_input_field('applicant[address]')
    end

    it 'renders the number input field' do
      assert_input_field('applicant[number]')
    end

    it 'renders the neighborhood input field' do
      assert_input_field('applicant[neighborhood]')
    end

    it 'renders the city input field' do
      assert_input_field('applicant[city]')
    end

    it 'renders the state input field' do
      assert_input_field('applicant[state]')
    end

    it 'renders the zip input field' do
      assert_input_field('applicant[zip]')
    end

    it 'renders the phone input field' do
      assert_input_field('applicant[phone]')
    end
  end

  context 'when displaying Financial Information' do
    it 'renders the salary input field' do
      assert_input_field('applicant[salary]')
    end

    it 'renders the inss_contribution_rate input field' do
      assert_input_field('applicant[inss_contribution_rate]')
    end

    it 'renders the salary_deduction input field' do
      assert_input_field('applicant[salary_deduction]')
    end
  end

  private

  def assert_input_field(field_name)
    assert_select 'input[name=?]', field_name
  end
end
