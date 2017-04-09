class Employee < ApplicationRecord
  has_many :tasks
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable
                
         
   after_create { |employee| employee.send_reset_password_instructions }
   
   #in select_boxes displayed only object,co change symbol of the attribute helped to me
    alias_attribute :name, :employee_name
 
def password_required?
  new_record? ? false : super
end
       
         
end
