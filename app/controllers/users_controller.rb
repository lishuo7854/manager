class UsersController < ApplicationController
  def index
  end


  def new
  	  @user=User.new
  end


	def create
	  @user=User.new(params.require(:user).permit(:email,:password,:password_confirmation))
	  if @user.save
	    flash[:notice]='注册成功'
	    redirect_to  '/users/index'
	  else
	    flash[:notice]='注册失败'
	    render action: :new
	  end
	end


	def logins
	if @user=login(params[:email],params[:password])
      flash[:notice]='登陆成功'
    redirect_to '/designer/index'
  else
    flash[:notice]='登陆失败'
     redirect_to '/users/index'
    end
	end

  def destroy
    logout
    cookies.delete :user_uuid
    flash[:notice] = "退出成功"
    redirect_to '/designer/index'
  end

end
