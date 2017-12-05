class ArticleCommentController < ApplicationController
  def index
  	
  end

  def create
  	@Articlecomment=Articlecomment.new
  	@Articlecomment.comment_text=params[:message]
    if logged_in?
  	@Articlecomment.user_id=current_user.id
    else
    @Articlecomment.user_id= 1000000000
    end
  	@Articlecomment.article_id=params[:id]
  	@Articlecomment.comment_time= Time.now
  	@Articlecomment.save
  	redirect_to '/designer/blog?id='+params[:id]
  end

  def destroy
    
  end
end
