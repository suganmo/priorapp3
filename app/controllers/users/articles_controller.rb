class Users::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = current_user.articles.all
    #@user = User.find(current_user.id)
    #@articles = @user.articles

  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_user.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "記事を作成しました。"
    else
      flash[:alert] = "記事の作成に失敗しました。"
    end
    redirect_to users_article_url(@article)
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update_attributes(article_params)
      flash[:notice] = "記事を編集しました。"
    else
      flash[:alert] = "記事の編集に失敗しました。"
    end
    redirect_to users_article_url(@article)
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.delete
    flash[:notice] = "記事「#{@article.title}」を削除しました。"
    redirect_to users_articles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :image, :user_id)
    end
end
