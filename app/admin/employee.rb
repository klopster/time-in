ActiveAdmin.register Employee do

permit_params :username,:email,
 							 :password ,:password_confirmation,
 							 :employee_name, :craftmanship_id, :admin,
 							 :pay_per_hour, :is_activ,
 							 :since, :up_to 
menu parent: "Employees"

controller do
  def update	
					if params[:employee][:password].blank? && params[:employee][:password_confirmation].blank?
    			params[:employee].delete(:password)
    			params[:employee].delete(:password_confirmation)
					end
   super
  end
end 
	
 

  index do
    selectable_column
    column :employee_name
    column :craftmanship
    column :email
    column :admin
    column :pay_per_hour
    actions
  	

  end
	
	
	
	
	
  filter :employee_name
  filter :craftmanship
  filter :is_activ, label: "Contract?"
  filter :pay_per_hour
  filter :admin 
  
	show do
	tabs do
  tab "Employee details" do
    attributes_table_for employee do
      row("Name and surname:") { employee.employee_name }
      row("Craftmanship:") { link_to employee.craftmanship.title, timein_craftmanships_path(employee.craftmanship_id) }
      row("Contract from:") {employee.since}
      row("Contract to:"){employee.up_to}
      row("Pay per hour:") {employee.pay_per_hour}
      row("Is the contract active?") { status_tag (employee.is_activ ? "Yes" : "Not yet"), (employee.is_activ ? :ok : :error) }
      end
    end
  tab "Access details" do
  	attributes_table_for employee do
  	 row("Username:") {employee.username}
  	 row("Email:")
     row("Is user main administrator?") { status_tag (employee.admin ? "Yes" : "Not yet"), (employee.admin ? :ok : :error) }
      end
    end
  tab "Comments" do
  	active_admin_comments 
  	end	
  
  end 
  
  end
	
	 
  
   form title: 'Employee details' do |f|
    
		tabs do
		tab 'Contract setup' do
			inputs do
			if current_employee.admin?
			input :employee_name, label: "Employee name"  
      input :craftmanship, label: "Craftmanship", hint:  "..not found craftmanship? #{link_to('...create new one!', new_timein_craftmanship_path)}".html_safe
      input :since, label: "Contract start at "
      li "Start at #{f.object.since}" unless f.object.new_record?
      input :up_to, label: "Contract up to"
      li "Up to #{f.object.up_to}" unless f.object.new_record?
    	input :pay_per_hour , label: "Salary per hour"
    	input :is_activ , label: "Contract is active?"
      else 
      para "You don´t have permissions for setup contract"
      end
      end
      end
    tab 'Access details' do
    	inputs do
    	input :username, label: "Username for sign in"
			input :email, label: "Email for confirmation and password reset"
			input :password, label: "Access password"
			input :password_confirmation, label: "Password confirm"
			if current_employee.admin?
			input :admin, label: "Set employee as an admin"
			end
			end	
		end	
    end
    para "Press cancel to return to the list without saving."
    actions
    
   end
	
		
	 
  

#end of class
end






# form do |f|
#    f.inputs "Employee Details" do
#      f.input :email
#      f.input :password
#      f.input :password_confirmation
#      f.input :admin if current_employee.admin? 
    	
#    end
#    f.actions
#  end

