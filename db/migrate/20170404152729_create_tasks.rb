class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :title
      t.boolean :is_done,default: 0
      t.date :due_date

      t.timestamps
    end
  end
end
