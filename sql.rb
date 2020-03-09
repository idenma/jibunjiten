all_post = []
user_post = []
search = "s"
contents = ["heading","subheading","content_1","content_2"]
user_id = 4
post = []

contents.map do |content|
  post << Post.find_by_sql(["SELECT * FROM posts join dictionaries on posts.dictionary_id = dictionaries.id where user_id = ? AND "+ content +" Like ? ",user_id,"%#{search}%"])


end

post.flatten!



p user_post.sort
