class CreateArticlecomments < ActiveRecord::Migration
  def change
    create_table :articlecomments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :comment_text
      t.date :comment_time
      t.timestamps null: false
    end
  end
end
