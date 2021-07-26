class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :amount, precision: 5, scale: 2
      t.boolean :is_expense
      t.belongs_to :user
      
      t.timestamps
    end
  end
end