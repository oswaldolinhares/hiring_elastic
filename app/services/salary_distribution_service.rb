# frozen_string_literal: true

class SalaryDistributionService
  FAIXA_NAMES = {
    'faixa1' => 'Até R$ 1.045,00',
    'faixa2' => 'De R$ 1.045,01 a R$ 2.089,60',
    'faixa3' => 'De R$ 2.089,61 até R$ 3.134,40',
    'faixa4' => 'De R$ 3.134,41 até R$ 6.101,06',
    'faixa5' => 'Maior que R$ 6.101,06'
  }.freeze

  def self.call
    new.calculate_distribution
  end

  def calculate_distribution
    distribution = group_applicants_by_salary
    total_funcionarios = total_employees(distribution)

    distribution.sort_by { |faixa, _| faixa }.to_h.transform_values do |applicants|
      build_distribution_data(applicants, total_funcionarios)
    end
  end

  private

  def group_applicants_by_salary
    Applicant.select(
      "CASE
        WHEN salary <= 1045 THEN 'faixa1'
        WHEN salary <= 2089.60 THEN 'faixa2'
        WHEN salary <= 3134.40 THEN 'faixa3'
        WHEN salary <= 6101.06 THEN 'faixa4'
        ELSE 'faixa5'
      END AS faixa_salarial",
      :name
    ).group_by(&:faixa_salarial)
  end

  def total_employees(distribution)
    distribution.values.flatten.size
  end

  def build_distribution_data(applicants, total_funcionarios)
    qtd = applicants.size
    percentual = calculate_percentual(qtd, total_funcionarios)
    {
      name: FAIXA_NAMES[applicants.first.faixa_salarial],
      qtd: qtd,
      percentual: percentual,
      applicants: applicants.map(&:name)
    }
  end

  def calculate_percentual(quantity, total)
    format('%.2f', total.positive? ? (quantity.to_f / total * 100).round(2) : 0)
  end
end
