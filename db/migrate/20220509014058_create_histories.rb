class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :coping,     null: false, foreign_key: true
      t.float :evaluation,      null: false
      t.integer :change_amount, null: false
      t.text :note

      t.timestamps
    end
  end
end
