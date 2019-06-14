class Employee < ApplicationRecord
    belongs_to :dog
    validates :title, uniqueness: { case_sensitive: false }
    validates :alias, uniqueness: { case_sensitive: false }
   
end
