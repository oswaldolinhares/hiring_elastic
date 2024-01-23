class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants, id: :uuid do |t|
      t.string :name
      t.string :cpf, null: false
      t.date :birth_date
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.decimal :salary
      t.decimal :inss_contribution_rate
      t.decimal :salary_deduction

      t.timestamps
    end

    add_index :applicants, :cpf, unique: true
  end
end
