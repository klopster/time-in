ActiveAdmin.register_page "Dashboard" do
 

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  
  columns do
  #if current_employee.admin?
  column do 
    panel "Your tasks for this week" do
    table_for current_employee.tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now) do |t|    
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, timein_task_path(task) }
      t.column("Assigned To") { |task| task.employee.email }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
  	  end
  	end
 	end
 	
 	
 	column do
  panel "Tasks that are late" do
    table_for current_employee.tasks.where('due_date < ?', Time.now) do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, timein_task_path(task) }
      t.column("Assigned To") { |task| task.employee.email }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    	end
  	end
  end
    
  end
  end
  
end
