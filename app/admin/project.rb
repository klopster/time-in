ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :project_id, craftmanship_ids:[]


action_item :new ,only: :show do
link_to 'New task for this project...', new_timein_task_path( task: { project_id: project.id })
end

#rewrite actions to redirect to index
 controller do
    def create
      super do |success,failure|
      	success.html { redirect_to timein_projects_path }
    	end
    end

   	def update
    	super do |success,failure|
      	success.html { redirect_to timein_projects_path }
    	end
  	end
	
end





index do
	selectable_column
  column :title do |project|
    link_to project.title, timein_project_path(project)
  end
  
  column 'Craftmanship' do |project|
    	project.craftmanships.pluck(:title).join("<br />").html_safe 	
    	end
      
  column "Tasks" do |project|
    project.tasks.count
  end
  
   
  column "Comments" do |project|
 	
 	status_tag (project.comments.where(resource: project).any? ? project.comments.where(resource: project).count : "0"), (project.comments.where(resource: project).any? ? :ok : :error)
  end
  
  	
	column "" do |project|
		link_to 'New task..', new_timein_task_path( task: { project_id: project.id })
		end	
		
  actions
end
 
# Filter only by title
filter :title
filter :craftmanships



show title: :title do
	tabs do	
   tab "Tasks" do
    table_for project.tasks do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, timein_task_path(task) }
			
#      t.column("Assigned To") { |task| task.employee.employee_name }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    end
  end
		tab "comments" do
		active_admin_comments
		end
	end
end

 
 form title: 'Project details' do |f|
 	inputs 'Details' do
	input :title, label: "Project name"
	input :craftmanships, as: :check_boxes, collection: Craftmanship.order("title ASC").all
	end
	actions
	end
		



#end of class
end
