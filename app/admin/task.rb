ActiveAdmin.register Task do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :project_id, :employee_id, :title, :is_done, :due_date
#filter :employee, collection: proc { Employee.pluck(:email, :id)}

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 scope :all, default: true
  scope :due_this_week do |tasks|
  	tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
end
	scope :late do |tasks|
  	tasks.where('due_date < ?', Time.now)
end
	scope :mine do |tasks|
  	tasks.where( employee_id: current_employee.id)
end




show do
  panel "Task Details" do
    attributes_table_for task do
      row("Status") { status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      row("Title") { task.title }
      row("Project") { link_to task.project.title, timein_project_path(task.project) }
      row("Assigned To") { link_to task.employee.email, timein_employee_path(task.employee) }
      row("Due Date") { task.due_date? ? l(task.due_date, :format => :long) : '-' } 
    end
  end
 
  active_admin_comments
end

sidebar "Other Tasks For This User", :only => :show do
  table_for current_employee.tasks.where(:project_id => task.project) do |t|
    t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
    t.column("Title") { |task| link_to task.title, timein_task_path(task) }
  end
end

#end of class
end




