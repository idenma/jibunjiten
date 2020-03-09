class AddColumnDictionaries < ActiveRecord::Migration[5.2]
  def change
    add_column :dictionaries, :style, :integer
  end
end
