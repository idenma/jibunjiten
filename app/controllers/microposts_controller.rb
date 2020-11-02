class MicropostsController < ApplicationController

 def new
   @Dictionary = Dictionary.find(params[:dictionary_id])
   @post = @Dictionary.posts.find(params[:post_id])

 end

 def create
   micropost = Dictionary.find(params[:dictionary_id]).posts.find(params[:post_id]).microposts.create(micropost_params)
   redirect_to(posts_show_path(params[:dictionary_id],params[:post_id]))
 end



 def update
   micropost = Micropost.find_by(id: params[:id])
   micropost.update(micropost_params)


   redirect_to(posts_show_path(params[:dictionary_id],params[:post_id]))
 end

 def destroy
 @Dictionary = Dictionary.find(params[:dictionary_id])
    micropost = Micropost.find_by(id: params[:id])#paramsに入れてあるidから指定のpostを探す
    micropost.destroy#で消す

    posts = Post.where(dictionary_id: @Dictionary.id).last
    redirect_to(posts_show_path(posts.dictionary_id, posts.id))
 end



 private

 def micropost_params
   params.permit(:subheading, :content_1, :content_2, :post_id)
 end

end
