class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :list, index: true, foreign_key: true
      t.float :amount
      t.string :title
      t.datetime :date
      t.string :type
      t.string :status

      t.timestamps null: false
    end
  end
end
