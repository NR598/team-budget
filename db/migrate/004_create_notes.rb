class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :body
      t.belongs_to :user
      t.belongs_to :transaction
    end
  end
end