class DictionariesController < ApplicationController

 def list
      if params[:dictionary_id] == nil && params[:id] == nil
        params[:dictionary_id] = Dictionary.last.id
        params[:id] = Post.last.id
       @Dictionary = Dictionary.find(params[:dictionary_id])
        @posts = Post.where(dictionary_id: @Dictionary)
        @post = Post.where(dictionary_id: @Dictionary).last
        @user = User.find(params[:id])
      else
       @Dictionary = Dictionary.find(params[:dictionary_id])
        @posts = Post.where(dictionary_id: @Dictionary)

        @post = Post.find_by(id:params[:id])
      end
 end

 def new
   if current_user
     @Dictionary = Dictionary.new
     @Dictionary.posts.build
   render "/dictionaries/new"
   end
 end

 def  create
   if current_user
     @oneDictionary = Dictionary.create(dictionary_params)
     @post = @oneDictionary.posts.create(posts_params)
     redirect_to (home_path)
   end
 end


 def edit
    @Dictionary = Dictionary.find_by(id: params[:id])
 end


 def update
   @oneDictionary = Dictionary.find_by(id: params[:id])
   @oneDictionary.update_attributes(only_dictionary_params)
   redirect_to (home_path)
 end

def destroy
  @oneDictionary = Dictionary.find_by(id: params[:id])
  @oneDictionary.destroy
  redirect_to (home_path)
 end






 private

 def dictionary_params
   params[:dictionary][:user_id] = current_user.id
   params.require(:dictionary).permit(:name,:style,:id,:user_id)
 end

 def only_dictionary_params
   params.require(:dictionary).permit(:name,:style, post_attributes:[:heading,:subheading,:content_1,:content_2,:id])
 end

 def posts_params
   params.require(:dictionary).require(:posts).permit(:heading,:subheading,:content_1,:content_2,:id)
 end

end
