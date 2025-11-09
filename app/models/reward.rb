class Reward < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :pc_name, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :reward, :foreign_key => :reward_type_id, :primary_key => :proper_id, :class_name => 'ProperName'

    scope :reward_graph_query, ->(reward_name) {
        self.notnil().includes(:pc_name, :reward).group(:result_no, :generate_no, :e_no, :reward_type_id).where("proper_names.name = '" + reward_name + "'")
    }
end
