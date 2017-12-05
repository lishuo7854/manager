class DesignerController < ApplicationController
  def index
  	@article = Article.all.limit(100)
    @article_banner= Article.where(digest: "on").order(id: "desc")
    @article_banner_index=[]
    @article_banner.map{ |x|
      p !x['image_path'].blank?
        if !x['image_path'].blank?
              @article_banner_index << x       
        end
    }


  end

  def blog_list
  p  @article_list=params[:type]
    if @article_list=="ttxw"
          @article_category = "头条新闻"
    elsif   @article_list=="qdkf"  
          @article_category = "前端开发"
    elsif   @article_list=="zcgh"  
          @article_category = "职场规划"
    elsif   @article_list=="cxydsj"  
          @article_category = "程序猿的世界"
    elsif   @article_list=="sysj"  
          @article_category = "摄影世界"
    elsif   @article_list=="zptj"  
          @article_category = "作品推荐"
    elsif   @article_list=="tszt"  
          @article_category = "图书专题"
    elsif   @article_list=="sjzt"  
          @article_category = "设计专题"
    elsif   @article_list=="hysj"  
          @article_category = "环游世界"      
    end	

    @article_list_table = Article.where(category: @article_category).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    @article_comments3 = Article.all.limit(3)
    @article_comments6 = Article.all.limit(6)
  	# @categories=Fenlei.roots.page(params[:page]||1).per_page(params[:per_page]||10).order(id:"desc")
  end







  def blog
#查找评论
 @Articlecomment=Articlecomment.where(article_id: params[:id])
# 查找当前文章的信息
  @article = Article.find_by(id: params[:id].to_i)	
  #查找上一篇文章
 # if params[:id].to_i+1 >  Article.last.id
 # 	@article1_id=params[:id].to_i
 # else
 # 	@article1_id=params[:id].to_i+1
 # end

 # if params[:id].to_i-1 < Article.first.id
 # 	@article0_id=params[:id].to_i
 # else
 # 	@article0_id=params[:id].to_i-1
 # end
#获取所有数组ｉｄ的索引
  @article_all_id_arry=[]
  @article_all_id=Article.all
  @article_all_id.map{|x|  @article_all_id_arry<<x['id']  }
  p @article_all_id_arry
  p@article_in_arry_index = @article_all_id_arry.index( params[:id].to_i)



#  @article_next = params[:id].to_i+1
#  @article_last = params[:id].to_i-1
# # p !@article_all_id_arry.include?(@article_next)
#  while  !@article_all_id_arry.include?(@article_next)

#   if @article_next >  Article.last.id
#   @article_next=Article.last.id
#  else
#   p@article_next
#   @article_next=@article_next + 1
#  end

#  end 
#   while  !@article_all_id_arry.include?(@article_last)
#     if @article_last<  Article.first.id
#   @article_last=Article.last.id
#  else
#   p@article_last
#   @article_last=@article_next - 1
#  end
#  end 

p @article_all_id_arry.length-1
if @article_in_arry_index==@article_all_id_arry.length-1
   @article_in_arry_indexfirst = 0
else
   @article_in_arry_indexfirst = @article_in_arry_index+1
end



  @article1 = Article.where(id:@article_all_id_arry[@article_in_arry_indexfirst])[0]
  @article0 = Article.where(id: @article_all_id_arry[@article_in_arry_index-1])[0]		
  end









# def create_article
  
# end


# def method_name
  
# end






































end
