class NextBattle < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

    belongs_to :pc_name, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
    belongs_to :status,	            :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Status'
    belongs_to :spec,	            :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Spec'
    belongs_to :regalia,            :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Regalium'
    belongs_to :intention,          :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Intention'
    belongs_to :partnership,        :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Partnership'
    has_many   :condition,          :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Condition'
    has_many   :assembly, -> { where(equip: 1..13)},             :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Item'
    total_id   = ProperName.where(name: "合計現金収入").maximum(:proper_id)
    attack_id  = ProperName.where(name: "攻撃戦果").maximum(:proper_id)
    support_id = ProperName.where(name: "支援戦果").maximum(:proper_id)
    defense_id = ProperName.where(name: "防衛戦果").maximum(:proper_id)
    belongs_to :total,    -> { where(reward_type_id: total_id)},    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
    belongs_to :attack,  -> { where(reward_type_id: attack_id)},  :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
    belongs_to :support, -> { where(reward_type_id: support_id)}, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
    belongs_to :defense, -> { where(reward_type_id: defense_id)}, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
end
