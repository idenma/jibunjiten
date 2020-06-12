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
    @posts = Post.where(dictionary_id: @Dictionary)
    @post = Post.find_by(id:params[:id])
  end

  def new
    @Dictionary = params[:dictionary_id]
  end

  def create
    @post =Post.create(post_params)

    redirect_to(posts_show_path(@post.dictionary_id, @post.id))
  end


 def edit
  @Dictionary = params[:dictionary_id]
  @post = Post.find_by(id:params[:id])
 end



  def update
   @Dictionary = params[:dictionary_id]
   @post = Post.find_by(id: params[:id])
   @post.heading = params[:heading]
   @post.subheading = params[:subheading]
   @post.content_1= params[:content_1]
   @post.content_2 = params[:content_2]
   @post.dictionary_id= params[:dictionary_id]
   @post.save
   redirect_to(posts_show_path(@Dictionary, @post.id))
  end



  def destroy
   @Dictionary = params[:dictionary_id]
   post = Post.find_by(id: params[:id])#paramsに入れてあるidから指定のpostを探す
   post.destroy#で消す

   if Post.find_by(dictionary_id: @Dictionary) == nil           #Dictionaryがあるのにpostがない時は=>辞書を消すよ？
     deadDictionaryName = Dictionary.find(@Dictionary).name     #一回消す辞書の名前を取っておく
     Dictionary.find(@Dictionary).destroy                       #デストローイ
     flash[:success] = "#{deadDictionaryName}を削除しました。"    #flashで表示
     lastDictionary = User.find(current_user.id).dictionaries.last                 #ユーザーのもつ辞書の最後を代入
     if lastDictionary == nil
       redirect_to("/dictionaries/new")
     else
     posts = Post.find_by(dictionary_id:lastDictionary.id)

     redirect_to(posts_show_path(posts.dictionary_id, posts.id))#ユーザーの持つ最後のpostに移動※ミスってる
   end
   else
     posts = Post.where(dictionary_id: @Dictionary).last
     redirect_to(posts_show_path(posts.dictionary_id, posts.id))
    end
  end


  private

  def post_params
    params.permit(:heading,:subheading,:content_1,:content_2,:dictionary_id)
  end



end
