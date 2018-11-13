class Regalium < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :regalia, :foreign_key => :regalia_id, :primary_key => :proper_id, :class_name => 'ProperName'
end
