class AddNumberToTome < ActiveRecord::Migration[6.1]
  def change
    add_column :tomes, :number, :integer
  end
end
