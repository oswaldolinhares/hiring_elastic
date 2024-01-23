# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/edit' do
  let(:applicant) { create(:applicant) }

  before do
    assign(:applicant, applicant)
    render
  end

  it 'renders the edit form' do
    assert_select 'form[action=?][method=?]', applicant_path(applicant), 'post'
  end

  shared_examples 'has input for field' do |field|
    it "has an input for applicant[#{field}]" do
      assert_select 'input[name=?]', "applicant[#{field}]"
    end
  end

  %w[name cpf address number neighborhood city state zip phone salary inss_contribution_rate
     salary_deduction].each do |field|
    include_examples 'has input for field', field
  end
end
