class HomeController < ApplicationController
  before_action :current_user?,only:[:index]


  def index
   if current_user && User.find(current_user.id).dictionaries.last != nil       #current_userが存在し、かつ辞書がある場合（上記直後 or  よく来るユーザー）
     @dictionaries = Dictionary.where(user_id:current_user.id)                  #user_idに紐づいたDictionaryを集める->ビュー表示
       if params[:dictionary_id] == nil && params[:id] == nil                   #もしログイン後初表示だった場合
         params[:dictionary_id] = @dictionaries.last.id                         #最後の辞書を選択
         params[:id] = Post.last.id                                             #最後の記事を表示
         @Dictionary = params[:dictionary_id]                                   #表示する辞書はparams内在の指定辞書
         @posts = Post.where(dictionary_id: @Dictionary).order("id ASC")                        #辞書に紐づいた記事を集める
         @post = Post.where(dictionary_id: @Dictionary).last                    #表示される記事は最後の記事
       end
   end
 end

 def dictionaryshow
   @dictionaries = Dictionary.where(user_id:current_user.id)                    #user_idに紐づいたDictionaryを集める->ビュー表示
   @Dictionary = params[:dictionary_id]                                         #表示する辞書はparams内在の指定辞書
   @posts = Post.where(dictionary_id: @Dictionary)                                 #辞書に紐づいた記事を集める
   @post = @posts.last
 end

  def show
    @dictionaries = Dictionary.where(user_id:current_user.id)                   #user_idに紐づいたDictionaryを集める->ビュー表示
    @Dictionary = params[:dictionary_id]                                        #表示する辞書はparams内在の指定辞書
    @posts = Post.where(dictionary_id: @Dictionary)                                 #辞書に紐づいた記事を集める
    @post = @posts.find(params[:id])
  end




  private

   def current_user?
     if current_user == nil                                                     #current_userが存在しない場合(サイト訪問直後)
       redirect_to ("/users/sign_in")                                           #サインインにリダイレクト
     elsif current_user && User.find(current_user.id).dictionaries.last == nil  #current_userが存在し、かつ辞書がない場合（サインイン直後）
       redirect_to ("/dictionaries/new")                                        #辞書作成のページにリダイレクト
     end
   end

end
