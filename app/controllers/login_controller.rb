class LoginController < ApplicationController
  def add_user
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash.now[:notice] = "ユーザ#{@user.name}が作成されました"
      @user = User.new
    end
  end

  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
    end
    if user
      session[:user_id] = user.id
      session[:user_name] = user.name
      flash[:notice] = "ユーザ#{user.name}がログインしました"
      redirect_to( :controller => "blog", :action => "index")
    else
      flash[:notice] = "無効なユーザ/パスワードの組み合わせです"
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to :action => "index"
  end

  def index
  end

  def delete_user
    if request.post?
      user = User.find(params[:id])
      begin
        user.destroy
        flash[:notice] = "ユーザ#{user.name}は削除されました"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_users)
  end

  def list_users
    @all_users = User.find(:all)
  end
end
