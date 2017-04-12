ActiveAdmin.register Task do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :project_id, :title, :is_done, :due_date, employee_ids:[]

#filter :employee, collection: proc { Employee.pluck(:email, :id)}


#define my own action,because task must be associated to project in project index
config.clear_action_items!

action_item :new_task do
link_to 'New task', timein_projects_path
end
 
  




 scope :all, default: true
 
  scope :due_this_week do |tasks|
  	tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
end
	scope :late do |tasks|
  	tasks.where('due_date < ?', Time.now)
end
#	scope :mine do |tasks|
#  	tasks.employees.where( employee_id: current_employee.id)
#end


index do
    selectable_column
    id_column
    column :title
    column 'Employees' do |task|
    	
    	task.employee.map(&:employee_name).join("<br />").html_safe
    	end
    column :project
#    column 'Craftmanship' do |task|
#    	task.project.craftmanships.map(&:title).join("<br />").html_safe 	
#    	end
    column :is_done
    column :due_date
    
    actions 
   
  	

  end
filter :title
filter :employee
filter :project
filter :is_done
filter :due_date

show do
 
  panel "Task Details" do
    attributes_table_for task do
      row("Status") { status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      row("Title") { task.title }
      row("Project") { link_to task.project.title, timein_project_path(task.project) }
#      row("Assigned To") { link_to task.employee.employee_name, timein_employee_path(task.employee) }
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








form title: 'Task details' do |f|
    inputs 'About task' do
    	input :title, label: "Task title:"
    	input :project_id, as: :hidden
      end
      inputs	'Employees for this task' do	
      task.project.craftmanships.each do |craftmanship|
      input :employee, label: "Craftmanship:  #{craftmanship.title}",
													 as: :check_boxes,
													 collection: craftmanship.employees
													 end
													 
			  
						
			end
			inputs 'Task details' do										 
			input :due_date
			
			unless task.id.nil?
			input :is_done, label: "Task is finished?",
												 as: :boolean
			end		
		end	
		
		para "Press cancel to return to the list without saving."
    actions
		end
		


#end of class
end




