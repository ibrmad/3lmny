class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :document_data
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
