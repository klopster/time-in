ActiveAdmin.register Craftmanship do


permit_params :title

actions :all, :except => [:show]
menu parent: "Employees"

index do
		selectable_column
   
    column :title
    column 'Employees' do |craftmanship|
    	craftmanship.employees.count
    	end
    column 'Employees' do |craftmanship|
     craftmanship.employees.map(&:employee_name).join("<br />").html_safe
  	  end
    
    
   	     			
   
 	actions
 	end

filter :title 	
filter :employees

 	
 	
 	
 	
show do

 attributes_table do
  row :title

  row 'Employees' do |n|
     craftmanship.employees.map(&:employee_name).join("<br />").html_safe
  end
 end

end




#end of class
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


