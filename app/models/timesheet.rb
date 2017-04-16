class Timesheet < ApplicationRecord
belongs_to :sheet
validates :hours, :sheet_id, :employee_id, :task_id, :date, presence: true

end

# :employee_id, :task_id,
