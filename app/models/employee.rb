class Employee < ApplicationRecord
    belongs_to :dog

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :alias, uniqueness: true, presence: true
    validates :title, uniqueness: true, presence: true

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
