class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :type
      t.integer :rate

      t.timestamps
    end
  end
end
