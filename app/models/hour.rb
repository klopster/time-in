class Hour < ApplicationRecord
belongs_to :task
belongs_to :employee

#validates :task_id, :employee_id, presence: true


end
