class Project < ApplicationRecord
has_many :tasks
has_and_belongs_to_many :craftmanships

has_many :active_admin_comments, as: :resource, class_name: 'ActiveAdmin::Comment'
alias_method :comments, :active_admin_comments

validates :title,presence: true

 
end
