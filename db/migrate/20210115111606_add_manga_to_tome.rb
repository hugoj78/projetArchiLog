class AddMangaToTome < ActiveRecord::Migration[6.1]
  def change
    add_reference :tomes, :manga, null: false, foreign_key: true
  end
end
