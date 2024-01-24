# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/index' do
  before do
    Faker::UniqueGenerator.clear
    assign(:applicants, create_list(:applicant, 2))
  end

  let(:cell_selector) { Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td' }

  def assert_fields(fields, count: 2)
    fields.each do |field|
      assert_select cell_selector, text: Regexp.new(field.to_s), count: count
    end
  end

  context 'when rendering personal information' do
    it 'displays the correct personal information' do
      render
      assert_fields(%w[Nome CPF Telefone])
    end
  end

  context 'when rendering address information' do
    it 'displays the correct address information' do
      render
      assert_fields(%w[Endereço Número Bairro Cidade Estado CEP])
    end
  end

  context 'when rendering financial information' do
    it 'displays the correct financial information' do
      render
      assert_fields(['9580.0', '12.0', '300.0'])
    end
  end
end
