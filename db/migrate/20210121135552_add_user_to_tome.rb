class AddUserToTome < ActiveRecord::Migration[6.1]
  def change
    add_reference :tomes, :user, null: false, foreign_key: true
  end
end
