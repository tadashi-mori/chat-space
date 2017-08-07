class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.text :name, null:false
      add_index :groups, :name, unique: true

      t.timestamps
    end
  end
end
