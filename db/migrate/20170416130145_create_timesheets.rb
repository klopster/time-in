class CreateTimesheets < ActiveRecord::Migration[5.0]
  def change
    create_table :timesheets do |t|
		t.belongs_to :sheet, index: true
		t.integer :employee_id, index: true
		t.integer :task_id, index: true
		t.integer :hours, default: 0
      t.date :date, default: 0
      t.text :note
      
      t.timestamps
    end
  end
end
