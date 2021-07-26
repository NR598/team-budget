class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.string :name
      t.decimal :amount, precision: 5, scale: 2
      t.belongs_to :user
      t.timestamps
    end
  end
end