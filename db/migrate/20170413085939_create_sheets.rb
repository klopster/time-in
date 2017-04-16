class CreateSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :sheets do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :task, index: true
      
      

      t.timestamps
    end
  end
end
