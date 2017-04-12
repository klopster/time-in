class CreateCraftmanships < ActiveRecord::Migration[5.0]
  def change
    create_table :craftmanships do |t|
    t.string :title
     
    t.timestamps
    end
  end
end
