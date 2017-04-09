ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title 
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  column :title do |project|
    link_to project.title, timein_project_path(project)
  end
 
  actions
end
 
# Filter only by title
filter :title




show :title => :title do
  panel "Tasks" do
    table_for project.tasks do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, timein_task_path(task) }
      t.column("Assigned To") { |task| task.employee.email }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    end
  end
end

 




#end of class
end
