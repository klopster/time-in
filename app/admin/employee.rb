ActiveAdmin.register Employee do

permit_params :username,:email,
 							 :password ,:password_confirmation,
 							 :employee_name, :group, :admin,
 							 :pay_per_hour, :is_activ,
 							 :since, :up_to 


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
    id_column
    column :employee_name
    column :group
    column :email
    column :admin
    column :pay_per_hour
    actions
  	

  end
	
	
	
	
	
  filter :employee_name
  filter :group
  filter :is_activ, label: "Contract?"
  filter :pay_per_hour
  filter :admin 
  

 
  
   form title: 'Employee details' do |f|
    inputs 'Details' do
    	input :employee_name, label: "Employee name"
    	input :username, label: "Add username to acces in a system"
			input :email, label: "Add email for password confirmation and reset"
			input :password, label: "Access password"
			input :password_confirmation, label: "Password confirm"
		end	
		
		inputs 'Contract setup' do
			if current_employee.admin?
			input :admin, label: "Set employee as an admin"  
      input :group, label: "Craftmanship"
      input :since, label: "Contract start at "
      li "Start at #{f.object.since}" unless f.object.new_record?
      input :up_to, label: "Contract up to"
      li "Up to #{f.object.up_to}" unless f.object.new_record?
    	input :is_activ , label: "Contract is active?"
      input :pay_per_hour , label: "Salary per hour"
      else 
      para "You don´t have permissions for setup contract"
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

