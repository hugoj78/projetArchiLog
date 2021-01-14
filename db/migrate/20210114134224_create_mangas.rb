class CreateMangas < ActiveRecord::Migration[6.1]
  def change
    create_table :mangas do |t|
      t.string :name
      t.string :description
      t.string :auteur

      t.timestamps
    end
  end
end
