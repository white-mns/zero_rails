class MarketsController < ApplicationController
  include MyUtility
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  def index
    placeholder_set
    param_set
    @count	= Market.notnil().includes(:pc_name, :kind, :orig, :add_effect, :fuka_1, :fuka_2).search(params[:q]).result.count()
    @search	= Market.notnil().includes(:pc_name, :kind, :orig, :add_effect, :fuka_1, :fuka_2).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @search.build_grouping
    @markets	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
        @show_detail_1 = "1"
    end
    
    params_to_form(params, @form_params, column_name: "pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "market_no", params_name: "market_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "name", params_name: "name_form", type: "text")
    params_to_form(params, @form_params, column_name: "kind_name", params_name: "kind_form", type: "text")
    params_to_form(params, @form_params, column_name: "unique_1", params_name: "unique_1_form", type: "number")
    params_to_form(params, @form_params, column_name: "unique_2", params_name: "unique_2_form", type: "number")
    params_to_form(params, @form_params, column_name: "value", params_name: "value_form", type: "number")
    params_to_form(params, @form_params, column_name: "invation", params_name: "invation_form", type: "number")
    params_to_form(params, @form_params, column_name: "encount", params_name: "encount_form", type: "number")
    params_to_form(params, @form_params, column_name: "technic", params_name: "technic_form", type: "number")
    params_to_form(params, @form_params, column_name: "goodwill", params_name: "goodwill_form", type: "number")
    params_to_form(params, @form_params, column_name: "intelligence", params_name: "intelligence_form", type: "number")
    params_to_form(params, @form_params, column_name: "stock", params_name: "stock_form", type: "number")
    params_to_form(params, @form_params, column_name: "add_effect_name", params_name: "add_effect_form", type: "text")
    params_to_form(params, @form_params, column_name: "strength", params_name: "strength_form", type: "number")
    params_to_form(params, @form_params, column_name: "equip", params_name: "equip_form", type: "number")
    params_to_form(params, @form_params, column_name: "fuka_1_name", params_name: "fuka_1_form", type: "text")
    params_to_form(params, @form_params, column_name: "fuka_2_name", params_name: "fuka_2_form", type: "text")
    params_to_form(params, @form_params, column_name: "charge", params_name: "charge_form", type: "number")
    params_to_form(params, @form_params, column_name: "orig_name", params_name: "orig_name_form", type: "text")

    @base_first    = (!params["is_form"]) ? "1" : "0"
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_1", first_opened: true)
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_2")
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
