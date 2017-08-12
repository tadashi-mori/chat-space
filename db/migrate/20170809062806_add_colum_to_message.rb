class AddColumToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :group_id, :integer,null: false, foreign_key: true
    add_column :messages, :user_id, :integer,null: false, foreign_key: true
  end
end
