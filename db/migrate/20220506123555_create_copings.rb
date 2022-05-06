class CreateCopings < ActiveRecord::Migration[6.1]
  def change
    create_table :copings do |t|
      t.references :coping_list, null: false, foreign_key: true
      t.string :coping_name,     null: false
      t.integer :cost_amount
      t.integer :time_amount
      t.string :emoji,           null: false
      t.integer :status,         null: false

      t.timestamps
    end
  end
end
