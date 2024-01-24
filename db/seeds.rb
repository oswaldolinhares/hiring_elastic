# db/seeds.rb

unless User.find_by(email: 'oswaldolinhares@gmail.com')
  User.create!(
    email: 'oswaldolinhares@gmail.com',
    password: 'contratado2024',
    password_confirmation: 'contratado2024'
  )
  puts 'User successfully created: oswaldolinhares@gmail.com, password: contratado2024'
else
  puts 'A user with this email already exists.'
end

salary_ranges = [
  0..1045.00,
  1045.01..2089.60,
  2089.61..3134.40,
  3134.41..6101.06
]

30.times do
  salary = rand(salary_ranges.sample)
  inss_calculation = Applicant.calculate_inss(salary)
  
  FactoryBot.create(
    :applicant,
    salary: salary.floor(2),
    inss_contribution_rate: inss_calculation[:rate].floor(2),
    salary_deduction: inss_calculation[:deduction]
  )
end

puts '30 Applicants created with varying salaries.'
