class MarketsController < ApplicationController
  include MyUtility
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  def index
    param_set
    @count	= Market.notnil().includes(:pc_name, :kind, :orig, :add_effect, :fuka_1, :fuka_2).search(params[:q]).result.count()
    @search	= Market.notnil().includes(:pc_name, :kind, :orig, :add_effect, :fuka_1, :fuka_2).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @markets	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
        @show_detail_1 = "1"
    end
    
    reference_text_assign(params, "pc_name_name", "pc_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "market_no", "market_no_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "kind_name", "kind_form")
    reference_number_assign(params, "unique_1", "unique_1_form")
    reference_number_assign(params, "unique_2", "unique_2_form")
    reference_number_assign(params, "value", "value_form")
    reference_number_assign(params, "invation", "invation_form")
    reference_number_assign(params, "encount", "encount_form")
    reference_number_assign(params, "technic", "technic_form")
    reference_number_assign(params, "goodwill", "goodwill_form")
    reference_number_assign(params, "intelligence", "intelligence_form")
    reference_number_assign(params, "stock", "stock_form")
    reference_text_assign(params, "add_effect_name", "add_effect_form")
    reference_number_assign(params, "strength", "strength_form")
    reference_number_assign(params, "equip", "equip_form")
    reference_text_assign(params, "fuka_1_name", "fuka_1_form")
    reference_text_assign(params, "fuka_2_name", "fuka_2_form")
    reference_number_assign(params, "charge", "charge_form")
    reference_text_assign(params, "orig_name", "orig_name_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @market_no_form = params["market_no_form"]
    @name_form = params["name_form"]
    @kind_form = params["kind_form"]
    @unique_1_form = params["unique_1_form"]
    @unique_2_form = params["unique_2_form"]
    @value_form = params["value_form"]
    @invation_form = params["invation_form"]
    @encount_form = params["encount_form"]
    @technic_form = params["technic_form"]
    @goodwill_form = params["goodwill_form"]
    @intelligence_form = params["intelligence_form"]
    @stock_form = params["stock_form"]
    @add_effect_form = params["add_effect_form"]
    @strength_form = params["strength_form"]
    @equip_form = params["equip_form"]
    @fuka_1_form = params["fuka_1_form"]
    @fuka_2_form = params["fuka_2_form"]
    @charge_form = params["charge_form"]
    @orig_name_form = params["orig_name_form"]

    @show_detail_1 = (!params["is_form"]) ? "1" : params["show_detail_1"]
    @show_detail_2 = params["show_detail_2"]
    @base_first    = (!params["is_form"]) ? "1" : "0"
  end
  # GET /markets/1
  #def show
  #end

  # GET /markets/new
  #def new
  #  @market = Market.new
  #end

  # GET /markets/1/edit
  #def edit
  #end

  # POST /markets
  #def create
  #  @market = Market.new(market_params)

  #  if @market.save
  #    redirect_to @market, notice: 'Market was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /markets/1
  #def update
  #  if @market.update(market_params)
  #    redirect_to @market, notice: 'Market was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /markets/1
  #def destroy
  #  @market.destroy
  #  redirect_to markets_url, notice: 'Market was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def market_params
      params.require(:market).permit(:result_no, :generate_no, :e_no, :market_no, :name, :kind_id, :unique_1, :unique_2, :value, :invation, :encount, :technic, :goodwill, :intelligence, :stock, :add_effect_id, :strength, :equip, :fuka_1_id, :fuka_2_id, :charge, :orig_name_id)
    end
end
