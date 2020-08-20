class Post < ApplicationRecord
 belongs_to:Dictionary,optional: true
 has_many :microposts, dependent: :destroy
 validates :heading,presence:true

def self.search(search,p)
  all_post = []
  contents = ["heading","subheading","content_1","content_2"]
  if search && p
   contents.map do |content|#contentsに入ってる要素で検索
   all_post << Post.find_by_sql(
     ["SELECT posts.id,posts.dictionary_id,heading,subheading,content_1,content_2,posts.updated_at FROM posts join dictionaries on posts.dictionary_id = dictionaries.id
       where user_id = ? AND "+ content +" Like ? ORDER BY dictionaries.id ASC",p,"%#{search}%"]
     )
  end
   all_post.flatten.uniq.sort_by{|x|x.dictionary_id}
  end
end

end
