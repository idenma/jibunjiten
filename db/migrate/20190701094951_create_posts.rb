class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :heading
      t.string :subheading
      t.text :content_1
      t.text :content_2

      t.timestamps
    end
  end
end
