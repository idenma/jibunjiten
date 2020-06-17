class MicropostsController < ApplicationController

 def new
   @Dictionary = params[:dictionary_id]
   @post = params[:post_id]

 end

 def create
   micropost = Dictionary.find(params[:dictionary_id]).posts.find(params[:post_id]).microposts.create(micropost_params)
   #Micropost.where(post_id: params[:post_id])
   redirect_to(posts_show_path(params[:dictionary_id],params[:post_id]))
 end

 def edit
   # @Dictionary = params[:dictionary_id]
   # @post = Post.find_by(id:params[:id])
   # @micropost = Micropost.find_by(id:params[:id])
 end

 def update
   redirect_to(posts_show_path(@Dictionary, @post.id))
 end

 def destroy
   @Dictionary = params[:dictionary_id]
    micropost = Micropost.find_by(id: params[:id])#paramsに入れてあるidから指定のpostを探す
    micropost.destroy#で消す

    posts = Post.where(dictionary_id: @Dictionary).last
    redirect_to(posts_show_path(posts.dictionary_id, posts.id))
 end



 private

 def micropost_params
   params.permit(:subheading,:content_1,:content_2,:post_id)
 end

end
