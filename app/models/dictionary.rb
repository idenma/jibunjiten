class Dictionary < ApplicationRecord
 belongs_to:User,optional: true
 has_many:posts,dependent: :destroy
 validates :name,presence:true


end
