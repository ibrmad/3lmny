class CreateMajors < ActiveRecord::Migration[5.0]
  def change
    create_table :majors do |t|
      t.string :name
      t.integer :faculty_id

      t.timestamps
    end
  end
end
