class Task < ApplicationRecord
 belongs_to :project
  belongs_to :employee

  validates :title, :project_id, :employee_id, presence: true
  validates :is_done, inclusion: { in: [true, false] }

 



  
 
#end of class
end
