class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :is_public
      t.boolean :is_approved

      t.timestamps
    end
  end
end
