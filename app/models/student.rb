class Student < ApplicationRecord
	has_many :comments

	validates :name, presence: true
	validate :check_date

	def check_date
		return if end_date.blank? || start_date.blank?
		if end_date < start_date
	    errors.add(:end_date, "cannot be before the start date") 
	  end 
	end
end
