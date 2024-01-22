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
