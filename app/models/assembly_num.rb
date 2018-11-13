class AssemblyNum < ApplicationRecord
    belongs_to :pc_name,     :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
    belongs_to :block,       :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Block'
    belongs_to :next_battle, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'NextBattle'
    belongs_to :unit,  :foreign_key => :proper_name_id, :primary_key => :proper_id, :class_name => 'ProperName'
    has_many   :assembly, -> { where(equip: 1..13)}, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Item'
    total_id   = ProperName.where(name: "合計現金収入").maximum(:proper_id)
    attack_id  = ProperName.where(name: "攻撃戦果").maximum(:proper_id)
    support_id = ProperName.where(name: "支援戦果").maximum(:proper_id)
    defense_id = ProperName.where(name: "防衛戦果").maximum(:proper_id)
    belongs_to :total,   -> { where(reward_type_id: total_id)},   :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
    belongs_to :attack,  -> { where(reward_type_id: attack_id)},  :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
    belongs_to :support, -> { where(reward_type_id: support_id)}, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
    belongs_to :defense, -> { where(reward_type_id: defense_id)}, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Reward'
end
