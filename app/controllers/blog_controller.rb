class BlogController < ApplicationController
  def index
    @entry_pages, @entries = paginate :entries, :per_page => 10
 end


  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  #verify :method => :post, :only => [ :destroy, :create, :update ]#,
  #       :redirect_to => { :action => :list }

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @users  = User.find(:all)
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    
    if session[:user_id]
      @entry.user_id = session[:user_id]
    else
      @entry.user_id = '1' # ゲストユーザ
    end

    if @entry.save
      flash[:notice] = '記事を作成しました'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      flash[:notice] = '記事を作成しました'
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private
  def user_session
    session[:user] ||= User.new
  end
end
