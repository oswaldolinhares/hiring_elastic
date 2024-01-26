# README
![Login](./examples/login.png)

## Description ##

Develop a web application using Ruby on Rails that calculates INSS (National Social Security Institute) discounts for applicants.

## Key Features: ##  


1. **Applicant Management (CRUD)**: Register applicants with details like name, CPF, date of birth, address, contact phones, and salary.
2. **INSS Discount Calculation**: On salary input, an Ajax request calculates the INSS discount, which is displayed and saved in the applicant's record.
3. **Employee Report**: Generate a report categorizing employees into salary ranges and represent this data both in list and chart formats.

## Technical Specifications

- Rails version 5 or higher.
- PostgreSQL database
- Bootstrap for front-end styling.(Used Tailwind CSS)
- Chart.js for data visualization.
- Rubocop Rails for code quality.
- Kaminari for pagination.
- Redis for data caching.
- Sidekiq for background job processing.

## Tooling ##

### Versions ###
* **Ruby**  3.2.2  
* **Rails**  7.0.8  


### Database and Storage ###   
* **PostgreSQL**

### Testing ###   
* **Rspec-rails**  Testing framework for Rails.  
* **Database_cleaner-active_record** Maintaining database consistency during Ruby on Rails tests.   
* **FactoryBotRails**  Used to easily create test objects with fake data.  
* **Faker**  Generates random data for testing.  
* **Shoulda-matchers**  Provides simplifications for testing Rails functionality. 

### Development ###   
* **Rubocop**  Code style analyzer and linter.  
* **Pry**  Debug and explore Ruby code interactively for better development.  

## Getting Started ##   
To get started, ensure that you have the following prerequisites installed on your system:

* Ruby (version 3.2.2)  
* Rails (version 7.0.8)  
* PostgreSQL

### Setup ###  

1. Clone the repository to your local machine.  

`git clone https://github.com/oswaldolinhares/hiring_elastic.git`  
  
2. Navigate to the project directory.   

`cd hiring_elastic`  
  
3. Create an environment variable file named **.env** at the root of the project.   

`touch .env`  

4. Add the required variables and their values to the **.env** file. 

```bash
cat << EOF > .env
DB_HOST='db'
DB_PORT='5432'
DB_POOL=''
DB_DATABASE='dojo_database'
DB_USERNAME='postgres'
DB_PASSWORD='postgres'
FERRUM_PDF_TOKEN='xyzabcd'
EOF
```

5. Stop local PostgreSQL instances to avoid port conflicts.   

* Mac: `pg_ctl -D /usr/local/var/postgres stop`  

* Linux: `sudo systemctl stop postgresql`  

* WSL: `psudo /etc/init.d/postgresql stop`  

  
6. Open Docker Desktop.   

.  

7. Execute **docker-compose**.   

`docker-compose up --build`  
  

### Running tests ###  

This command will execute all the tests

`bundle exec rspec spec`  

### Running the project ###  

Execute docke-compose

`docker-compose up`  

### Authentication ###  

login: oswaldolinhares@gmail.com  
password: contratado2024

### PDF Example ###  

[Download do Relatório em PDF](./examples/report.pdf).  

### Screenshots ###  
[LOGIN](./examples/login.png)  
[INDEX](./examples/index.png)  
[CREATE](./examples/create.png)  
[EDIT](./examples/edit.png)  
[REPORT](./examples/report.png)  
