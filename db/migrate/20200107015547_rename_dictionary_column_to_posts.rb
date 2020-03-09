class RenameDictionaryColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :Dictionary, :dictionary_id
  end
end
