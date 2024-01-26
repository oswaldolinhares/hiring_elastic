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

  def download_pdf
    report_url = salary_distributions_url(ferrum_pdf_token: ENV.fetch('FERRUM_PDF_TOKEN', nil))

    browser = Ferrum::Browser.new
    browser.go_to(report_url)

    sleep 1

    pdf_path = "tmp/report_#{Time.now.to_i}.pdf"
    browser.pdf(path: pdf_path)

    browser.quit

    send_file pdf_path, type: 'application/pdf', disposition: 'attachment', filename: 'relatorio_braziu.pdf'
  end

  private

  def check_ferrum_pdf_token
    return if params[:ferrum_pdf_token] == ENV['FERRUM_PDF_TOKEN']

    head :forbidden
  end
end
