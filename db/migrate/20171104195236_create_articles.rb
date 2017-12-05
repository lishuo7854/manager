class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id 	
      t.string :category   #文章分类板块
      t.string :title     #标题
	  t.string :subhead #副标
	  t.text :details  #内容
	  t.string :type     #文章类型
	  t.string :author  #作者
	  t.string :inputer #录入者
	  t.string :source #来源
	  t.string :digest, default:"off" #置顶
	  t.string :recommend, default:"off" #是否推荐
	  t.date :modified #更新时间
	  t.date :created #添加时间
      t.date :last_post #最后评论时间
	  t.string :file_path #文件地址
	  t.string :image_path #图片地址
      t.string :keyword #关键字
      t.integer :hits #点击数
      t.integer :post_num#评论数
      t.timestamps null: false
    end
  end
end
