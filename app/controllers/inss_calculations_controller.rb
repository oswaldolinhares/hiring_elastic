# frozen_string_literal: true

class InssCalculationsController < ApplicationController
  protect_from_forgery

  def calculate
    salary = params[:salary].to_f
    result = Applicant.calculate_inss(salary)

    render json: result, status: :ok
  end
end
