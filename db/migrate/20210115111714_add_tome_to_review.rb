class AddTomeToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :tome, null: false, foreign_key: true
  end
end
