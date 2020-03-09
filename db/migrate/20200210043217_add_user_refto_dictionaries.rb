class AddUserReftoDictionaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :dictionaries, :user, index:true
  end
end
