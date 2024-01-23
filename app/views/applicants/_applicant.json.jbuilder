json.extract! applicant, :id, :name, :cpf, :birth_date, :address, :number, :neighborhood, :city, :state, :zip, :phone, :salary, :inss_contribution_rate, :salary_deduction, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
