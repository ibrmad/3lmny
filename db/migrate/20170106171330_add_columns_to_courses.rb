class AddColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :image_data, :text
    add_column :courses, :description, :text
  end
end
