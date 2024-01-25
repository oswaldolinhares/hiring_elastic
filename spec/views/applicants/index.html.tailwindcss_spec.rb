# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/index' do
  before do
    Faker::UniqueGenerator.clear
    assign(:applicants, create_list(:applicant, 2))
  end

  let(:cell_selector) { 'tr>td' }

  def assert_fields(fields, count: 2)
    fields.each do |field|
      assert_select cell_selector, text: Regexp.new(field.to_s), count: count
    end
  end

  context 'when rendering financial information' do
    it 'displays the correct financial information' do
      render
      assert_fields(%w[Visualizar Editar Excluir])
    end
  end
end
