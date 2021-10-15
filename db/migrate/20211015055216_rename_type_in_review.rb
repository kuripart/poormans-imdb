class RenameTypeInReview < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :type, :review_type 
  end
end
