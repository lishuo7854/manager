class AddPostedtimeToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :postedtime, :date,default: Time.now
  end
end
