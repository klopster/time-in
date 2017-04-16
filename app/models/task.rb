class Task < ApplicationRecord
 belongs_to :project
  
 has_many :sheets
 has_many :employees, through: :sheets
 has_many :timesheets 
  
  
has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
alias_method :comments, :active_admin_comments  

  validates :title, :project_id, presence: true
  validates :is_done, inclusion: { in: [true, false] }

 



  
 
#end of class
end
