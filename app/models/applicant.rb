# frozen_string_literal: true

class Applicant < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true
end
