class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.belongs_to :question

      t.timestamps null: false
    end
  end
end
