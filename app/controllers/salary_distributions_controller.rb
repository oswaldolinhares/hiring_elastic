# frozen_string_literal: true

class SalaryDistributionsController < ApplicationController
  def index
    @salary_distribution = SalaryDistributionService.call

    @chart_data = {
      labels: @salary_distribution.map { |_faixa, dados| dados[:name] },
      datasets: [{
        label: 'Quantidade de Funcionários',
        data: @salary_distribution.map { |_faixa, dados| dados[:qtd] },
        backgroundColor: %w[
          Red Blue Yellow Green Purple
        ],
        borderColor: [],
        borderWidth: 1
      }]
    }

    @faixa_maior_concentracao = @salary_distribution.max_by { |_faixa, dados| dados[:qtd] }

    @faixa_menor_concentracao = @salary_distribution.min_by { |_faixa, dados| dados[:qtd] }
  end
end
