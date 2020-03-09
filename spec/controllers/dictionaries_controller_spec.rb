require 'rails_helper'





RSpec.describe DictionariesController, type: :controller do
  describe 'dictionaryの保存について' do

    before do
      @dictionary = Dictionary.new(name:"hello",style:0)
    end

    it 'dictionaryが存在すること' do
      expect(@dictionary).to be_valid
    end

    it 'dictionaryを保存できること' do
      dic = Dictionary.create(name:"hello",style:0)

    end

    it 'dictionaryに関連付けしているpostを保存できること' do
      dic = Dictionary.create(name:"hello",style:0)
      dictio = dic.posts.new(heading: "hello", content_1: "world!!")
      dictio.save
    end

    it 'dictionaryに関連付けしているpostを確認できること' do
      dic = Dictionary.create(name:"hello",style:0)
      dictio = dic.posts.new(heading: "hello", content_1: "world!!")
      dictio.save
      posts = Post.all
      expect(posts).to include dictio
    end

    it '題名のないDictionaryは作れないこと'do
      dictionary = Dictionary.new(name:" ",style:0)
      expect(dictionary).not_to be_valid
    end

    it '見出し１のないDictionaryは作れないこと'do
      dictionary = Dictionary.new(name:"#",style:0)
      post = dictionary.posts.new(heading:" ")
      expect(post).not_to be_valid
    end
    
    it "dictionaryとpost同時に作れるか" do
     @Dictionary = Dictionary.new
     @post = @Dictionary.posts.new
    end




 end


end
