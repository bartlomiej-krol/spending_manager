class CreateSpendings < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.string :spending_name
      t.float :value

      t.timestamps null: false
    end
  end
end
