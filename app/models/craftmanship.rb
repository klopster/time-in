class Craftmanship < ApplicationRecord
has_many :employees
has_and_belongs_to_many :projects
validates :title, presence: true

 alias_attribute :name, :title


end
