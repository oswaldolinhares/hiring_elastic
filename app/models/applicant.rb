# frozen_string_literal: true

class Applicant < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true

  INSS_RATES = [
    { limit: 1045.00, rate: 0.075 },
    { limit: 2089.60, rate: 0.09 },
    { limit: 3134.40, rate: 0.12 },
    { limit: 6101.06, rate: 0.14 }
  ].freeze

  def self.calculate_inss(salary)
    return { rate: 0, deduction: 0 } if salary <= 0

    deduction = calculate_deduction(salary)
    rate = determine_rate(salary)

    { rate: rate, deduction: deduction.round(2) }
  end

  def self.calculate_deduction(salary)
    deduction = 0
    previous_limit = 0

    INSS_RATES.each do |tier|
      current_limit = [salary, tier[:limit]].min
      deduction += ((current_limit - previous_limit) * tier[:rate]).floor(2)
      previous_limit = current_limit
      break if salary <= tier[:limit]
    end

    deduction
  end

  def self.determine_rate(salary)
    tier = INSS_RATES.find { |t| salary <= t[:limit] } || INSS_RATES.last
    (tier[:rate] * 100).floor(2)
  end
end
