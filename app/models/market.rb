class Market < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :kind,       :foreign_key => :kind_id,       :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :orig,       :foreign_key => :orig_name_id,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :add_effect, :foreign_key => :add_effect_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :fuka_1,     :foreign_key => :fuka_1_id,     :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :fuka_2,     :foreign_key => :fuka_2_id,     :primary_key => :proper_id, :class_name => 'ProperName'
end
