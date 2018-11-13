class Intention < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :intention, :foreign_key => :intention_id, :primary_key => :proper_id, :class_name => 'ProperName'
end
