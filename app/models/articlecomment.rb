class Articlecomment < ActiveRecord::Base
	belongs_to :user,:class_name=>'User',:foreign_key=>"user_id"
     delegate :email, to: :user
	belongs_to :article,:class_name=>'Article',:foreign_key=>"article_id"
     delegate :email, to: :article
end
