class Article < ActiveRecord::Base
	has_many :articlecomment,:class_name=>'Articlecomment',:foreign_key=>'article_id'
    belongs_to :user,:class_name=>'User',:foreign_key=>'user_id'
    delegate :email, to: :user
end
