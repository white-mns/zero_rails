class BlocksController < ApplicationController
  include MyUtility
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  # GET /blocks
  def index
    param_set
    @count	= Block.notnil().includes(:pc_name, :status, :spec, :total, :attack, :support, :defense, [condition: :condition], [assembly: :orig], [regalia: :regalia], [intention: :intention], [partnership: :partnership]).search(params[:q]).result.count()
    @search	= Block.notnil().includes(:pc_name, :status, :spec, :total, :attack, :support, :defense, [condition: :condition], [assembly: :orig], [regalia: :regalia], [intention: :intention], [partnership: :partnership]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @blocks	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')

    params[:q] = {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "pc_name_name", "pc_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "block_no", "block_no_form")
    reference_number_assign(params, "e_no", "e_no_form")

    reference_number_assign(params, "status_ranking_rate", "ranking_rate_form")
    reference_number_assign(params, "status_rp", "rp_form")
    reference_number_assign(params, "total_value", "total_income_form")
    reference_number_assign(params, "attack_value", "attack_form")
    reference_number_assign(params, "support_value", "support_form")
    reference_number_assign(params, "defense_value", "defense_form")
    reference_text_assign(params, "assembly_orig_name", "assembly_form")
    reference_text_assign(params, "regalia_regalia_name", "regalia_form")
    reference_text_assign(params, "intention_intention_name", "intention_form")
    reference_text_assign(params, "partnership_partner_e_no", "partnership_form")
    reference_text_assign(params, "partnership_partnership_name", "partnership_name_form")
    reference_number_assign(params, "spec_invation", "invation_form")
    reference_number_assign(params, "spec_encount", "encount_form")
    reference_number_assign(params, "spec_technic", "technic_form")
    reference_number_assign(params, "spec_goodwill", "goodwill_form")
    reference_number_assign(params, "spec_intelligence", "intelligence_form")
    reference_number_assign(params, "spec_drink", "drink_form")
    reference_number_assign(params, "spec_illegality", "illegality_form")
    reference_text_assign(params, "condition_condition_name", "condition_text_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @block_no_form = params["block_no_form"]
    @e_no_form = params["e_no_form"]

    @ranking_rate_form = params["ranking_rate_form"]
    @rp_form = params["rp_form"]
    @total_income_form = params["total_income_form"]
    @attack_form = params["attack_form"]
    @support_form = params["support_form"]
    @defense_form = params["defense_form"]
    @leg_form = params["leg_form"]
    @assembly_form = params["assembly_form"]
    @regalia_form = params["regalia_form"]
    @intention_form = params["intention_form"]
    @partnership_form = params["partnership_form"]
    @partnership_name_form = params["partnership_name_form"]
    @invation_form = params["invation_form"]
    @encount_form = params["encount_form"]
    @technic_form = params["technic_form"]
    @goodwill_form = params["goodwill_form"]
    @intelligence_form = params["intelligence_form"]
    @drink_form = params["drink_form"]
    @illegality_form = params["illegality_form"]
    @condition_text_form = params["condition_text_form"]

    @show_detail_status_1 = params["show_detail_status_1"]
    @show_detail_reward_1 = (!params["is_form"]) ? "1" : params["show_detail_reward_1"]
    @show_detail_assembly_1 = params["show_detail_assembly_1"]
    @show_all_assembly = params["show_all_assembly"]
    @show_detail_regalia_1 = (!params["is_form"]) ? "1" : params["show_detail_regalia_1"]
    @show_detail_intention_1 = (!params["is_form"]) ? "1" : params["show_detail_intention_1"]
    @show_detail_partnership_1 = params["show_detail_partnership_1"]
    @show_partnership_name = params["show_partnership_name"]
    @show_detail_spec_1 = params["show_detail_spec_1"]
    @show_detail_spec_2 = params["show_detail_spec_2"]
    @show_detail_spec_3 = params["show_detail_spec_3"]
    @show_detail_condition_1 = params["show_detail_condition_1"]
    @base_first    = (!params["is_form"]) ? "1" : "0"
  end
  # GET /blocks/1
  #def show
  #end

  # GET /blocks/new
  #def new
  #  @block = Block.new
  #end

  # GET /blocks/1/edit
  #def edit
  #end

  # POST /blocks
  #def create
  #  @block = Block.new(block_params)

  #  if @block.save
  #    redirect_to @block, notice: 'Block was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /blocks/1
  #def update
  #  if @block.update(block_params)
  #    redirect_to @block, notice: 'Block was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /blocks/1
  #def destroy
  #  @block.destroy
  #  redirect_to blocks_url, notice: 'Block was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def block_params
      params.require(:block).permit(:result_no, :generate_no, :block_no, :e_no)
    end
end
