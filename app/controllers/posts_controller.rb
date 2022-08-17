class PostsController < ApplicationController


  def search
    if current_user
      p = current_user.id
     @posts = Post.search(params[:search],p)
     @post = @posts.first
    end

  end

  def search_show
    if current_user
      p = current_user.id
     @posts = Post.search(params[:search],p)
     @post = Post.find_by(id: params[:id])
    end
  end


  def show
    dictionary_collect
    post_read
    @post = Post.find_by(id: params[:id])
    microposts_call
  end

  def new
     @Dictionary = Dictionary.find(params[:dictionary_id])
  end

  def create
    @post =Post.create(post_params)

    redirect_to(posts_show_path(@post.dictionary_id, @post.id))
  end


 def edit
   @Dictionary = Dictionary.find(params[:dictionary_id])
  @post = Post.find_by(id:params[:id])
 end



  def update
 @Dictionary = Dictionary.find(params[:dictionary_id])
   @post = Post.find_by(id: params[:id])
   @post.update(post_params)
   redirect_to(posts_show_path(params[:dictionary_id],params[:id]))

  end



  def destroy
   @Dictionary = Dictionary.find(params[:dictionary_id])
   post = Post.find_by(id: params[:id])#paramsに入れてあるidから指定のpostを探す
   post.destroy#で消す

   if Post.find_by(dictionary_id: @Dictionary.id) == nil           #Dictionaryがあるのにpostがない時は=>辞書を消すよ？
     deadDictionaryName = Dictionary.find(@Dictionary.id).name     #一回消す辞書の名前を取っておく
     Dictionary.find(@Dictionary.id).destroy                       #デストローイ
     flash[:success] = "#{deadDictionaryName}を削除しました。"    #flashで表示
     lastDictionary = User.find(current_user.id).dictionaries.last                 #ユーザーのもつ辞書の最後を代入
     if lastDictionary == nil
       redirect_to("/dictionaries/new")
     else
     posts = Post.find_by(dictionary_id:lastDictionary.id)

     redirect_to(posts_show_path(posts.dictionary_id, posts.id))#ユーザーの持つ最後のpostに移動※ミスってる
   end
   else
     posts = Post.where(dictionary_id: @Dictionary.id).last
     redirect_to(posts_show_path(params[:dictionary_id],posts.id))
    end
  end


  private

  def post_params
    params.permit(:heading,:subheading,:content_1,:content_2,:dictionary_id)
  end

  def post_read
 @Dictionary = Dictionary.find(params[:dictionary_id])                             #表示する辞書はparams内在の指定辞書
   @posts = Post.where(dictionary_id: @Dictionary.id).order("id ASC")
  end

  def dictionary_collect
    @dictionaries = Dictionary.where(user_id:current_user.id)                    #user_idに紐づいたDictionaryを集める->ビュー表示
  end

  def microposts_call
    if params[:id] == nil#このpostにmicropostが存在するなら
       @microposts = false
    else
      @microposts = Micropost.where(post_id: @post.id).order(created_at: :asc)
    end
  end

end
