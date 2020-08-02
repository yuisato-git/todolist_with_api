class CreateTodoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_comments do |t|
      t.references :todo_item, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
