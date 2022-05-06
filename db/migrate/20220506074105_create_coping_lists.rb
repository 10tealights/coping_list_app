class CreateCopingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :coping_lists do |t|
      t.string :list_name, null: false
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
