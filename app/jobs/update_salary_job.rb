# frozen_string_literal: true

class UpdateSalaryJob < ApplicationJob
  queue_as :default

  def perform(applicant_id, new_salary)
    applicant = Applicant.find(applicant_id)
    applicant.update(salary: new_salary)
  end
end
