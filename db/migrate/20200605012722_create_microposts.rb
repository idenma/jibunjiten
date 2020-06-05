class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.string :subheading
      t.text :content_1
      t.text :content_2
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
