class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :task, index: true
      t.integer :hours, default: 0
      

      t.timestamps
    end
  end
end
