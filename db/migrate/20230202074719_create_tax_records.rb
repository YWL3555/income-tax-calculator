class CreateTaxRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :tax_records do |t|
      t.string :timestamp
      t.string :employee_name
      t.string :annual_salary
      t.string :monthly_income_tax

      t.timestamps
    end
  end
end
