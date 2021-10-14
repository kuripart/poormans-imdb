class ChangeRateColumnOnReviews < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reviews, :rate, false
  end
end
