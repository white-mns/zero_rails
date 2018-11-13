class Partnership < ApplicationRecord
	belongs_to :pc_name,     :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :partnership, :foreign_key => [:partner_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
end
