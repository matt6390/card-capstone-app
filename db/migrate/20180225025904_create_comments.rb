class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.integer :user_id
      t.integer :commentable_type
      t.string :text

      t.timestamps
    end
  end
end
