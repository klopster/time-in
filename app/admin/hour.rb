ActiveAdmin.register Hour do


 permit_params :hours, :task_id, :employee_ids
 
 #rewrite actions to redirect to index
 controller do
    def create
      super do |success,failure|
      	success.html { redirect_to timein_tasks_path }
    	end
    end

   	def update
    	super do |success,failure|
      	success.html { redirect_to timein_tasks_path }
    	end
  	end
	
end
 
 
 form title: "Time entry:",partial: "hours/form"
	
	
						
					 
				
				 
#end of class
end
				 	 
