class ArticleController < ApplicationController
  before_action :must_login,only:[:index,:article_list_edit]
  def index
  end

  def created
      @up_file = params[:localfile]
      myfile = MyuploaderUploader.new
      myfile.store!(@up_file)
      @category=Article.new(params.require(:article).permit(:category))
      @article=Article.new
   	  @article.title = params[:title]
   	  @article.subhead =    params[:subhead]
   	  @article.category  =    @category['category']
   	  @article.author  =    params[:author]
   	  @article.source  =    params[:source]
   	  @article.postedtime =    params[:postedtime]
      if params[:digest].blank?
      @article.digest  =   'off'
      p "offoffoff"
      elsif params[:digest]= 'on'
        p "ononononon"
      @article.digest  =   'on'  
      end
   	  @article.details =    params[:details]
   	  @article.inputer = current_user.email 
      @article.user_id = current_user.id 
      @article.image_path =    "#{$time}#{$a}"
      @article.save 
  	redirect_to '/article/index'
  end



def article_list_edit
    @article_list=params[:type]
    if @article_list=="ttxw"
          @article_category =    Article.where(category: "头条新闻").page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="qdkf"  
          @article_category =   Article.where(category: "前端开发" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="zcgh"  
          @article_category =   Article.where(category:"职场规划" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="cxydsj"  
          @article_category = Article.where(category: "程序猿的世界" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="sysj"  
          @article_category =   Article.where(category: "摄影世界" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="zptj"  
          @article_category =   Article.where(category: "作品推荐" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="tszt"  
          @article_category =  Article.where(category:"图书专题"  ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="sjzt"  
          @article_category =   Article.where(category: "设计专题" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
    elsif   @article_list=="hysj"  
          @article_category =   Article.where(category: "环游世界" ).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")      
    elsif   @article_list== nil
            @article_edit_all=Article.all.page(params[:page]||1).per_page(params[:per_page]||10).order(id:"desc")
    end 


    # @article_edit_all=Article.where(category: @article_category).page(params[:page]||1).per_page(params[:per_page]||5).order(id:"desc")
end



def delete_article
   @delete_article=Article.find(params[:delete])
   @delete_article.destroy
   redirect_to "/article/article_list_edit"  
end

def edit_article
  @edit_article=Article.find(params[:edit])
end

def edit_article_post
      @up_file = params[:localfile]
      myfile = MyuploaderUploader.new
      myfile.store!(@up_file)
      @category=Article.new(params.require(:article).permit(:category))
      @article=Article.find_by(id: params[:id])
      @article.title = params[:title]
      @article.subhead =    params[:subhead]
      @article.category  =    @category['category']
      @article.author  =    params[:author]
      @article.source  =    params[:source]
      @article.postedtime =    params[:postedtime]
      # @article.digest  =    params[:digest]
    if params[:digest].blank?
      @article.digest  =   'off'
      p "offoffoff"
      elsif params[:digest]= 'on'
        p "ononononon"
      @article.digest  =   'on'  
      end
      @article.details =    params[:details]
      @article.inputer = current_user.email 
      @article.user_id = current_user.id 
      # @article.image_path =    "#{$time}#{$a}"
      @article.save 
      redirect_to '/article/article_list_edit'
end



end
