class MediaToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :media, :string
  end
end
