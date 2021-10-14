class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.date :dob
      t.string :sex

      t.timestamps
    end
  end
end
