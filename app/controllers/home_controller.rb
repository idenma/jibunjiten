class HomeController < ApplicationController
  before_action :current_user?,only:[:index]


  def index
   if current_user && User.find(current_user.id).dictionaries.last != nil       #current_userが存在し、かつ辞書がある場合（上記直後 or  よく来るユーザー）
     dictionary_collect
       if params[:dictionary_id] == nil && params[:id] == nil                   #もしログイン後初表示だった場合
         params[:dictionary_id] = @dictionaries.last.id                         #最後の辞書を選択
         params[:id] = Post.last.id                                             #最後の記事を表示
         post_read             											                        		#辞書に紐づいた記事を集める
         @post = Post.where(dictionary_id: @Dictionary).last                    #表示される記事は最後の記事

        microposts_call                                                         #micropostを呼び出し

       end
   end
 end

 def dictionaryshow
   dictionary_collect
   post_read                      									         #辞書に紐づいた記事を集める
   @post = @posts.last
 end

  def show
    dictionary_collect
    post_read                          										    #辞書に紐づいた記事を集める
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

   def post_read
    @Dictionary = params[:dictionary_id]                                   #表示する辞書はparams内在の指定辞書
    @posts = Post.where(dictionary_id: @Dictionary).order("id ASC")
   end

   def dictionary_collect
     @dictionaries = Dictionary.where(user_id:current_user.id)                    #user_idに紐づいたDictionaryを集める->ビュー表示
   end

   def microposts_call
     @microposts = false

     if @post.microposts.count > 0 #このpostにmicropostが存在するなら
       @microposts = true
     end
   end

end
