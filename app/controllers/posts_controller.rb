class PostsController < ApplicationController

  def index
    @Dictionary = params[:dictionary_id]
    @posts = Post.where(Dictionary:@Dictionary)
    @post = Post.where(Dictionary:@Dictionary).last


  end



  def firstCreate
    @Dictionary = params[:dictionary_id]
  @post = Post.create(id:1,heading:"Welcome railsmemo!",subheading:"first",content_1:"first",content_2:"first",dictionary_id: @Dictionary)
  end




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
   @post = Post.find_by(id: params[:id])#paramsに入れてあるidから指定のpostを探す
   @post.destroy#で消す
#Dictionaryがあるのにpostがない時は
   if Post.find_by(dictionary_id: @Dictionary) == nil
     deadDictionaryName = Dictionary.find(@Dictionary).name
     Dictionary.find(@Dictionary).destroy
     flash[:success] = "#{deadDictionaryName}を削除しました。"
     posts = Post.last
     redirect_to(posts_show_path(posts.dictionary_id, posts.id))
   else
     posts = Post.where(dictionary_id: @Dictionary).last
     redirect_to(posts_show_path(posts.dictionary_id, posts.id))
    end
  end




  def sql
   @posts = Post.all
  end



  private

  def post_params
    params.permit(:heading,:subheading,:content_1,:content_2,:dictionary_id)
  end



end
