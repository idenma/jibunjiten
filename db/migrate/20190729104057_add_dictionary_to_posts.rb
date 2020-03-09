class AddDictionaryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :Dictionary, :integer
  end
end
