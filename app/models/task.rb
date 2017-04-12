class Task < ApplicationRecord
 belongs_to :project
  has_and_belongs_to_many :employee
  

  validates :title, :project_id, presence: true
  validates :is_done, inclusion: { in: [true, false] }

 



  
 
#end of class
end
