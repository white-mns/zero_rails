class ItemsController < ApplicationController
  include MyUtility
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    placeholder_set
    param_set
    @count	= Item.notnil().includes(:pc_name, :kind, :orig, :add_effect, :fuka_1, :fuka_2).ransack(params[:q]).result.count()
    @search	= Item.notnil().includes(:pc_name, :kind, :orig, :add_effect, :fuka_1, :fuka_2).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @items	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
        @show_detail_1 = "1"
    end
    params[:q]["e_no_not_eq_any"] ||= [0]

    params_to_form(params, @form_params, column_name: "pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "i_no", params_name: "i_no_form", type: "number")
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
    params_to_form(params, @form_params, column_name: "orig_name", params_name: "orig_name_form", type: "text")
    
    params[:q]["equip_eq_any"] ||= []
    params[:q]["equip_gteq_any"] ||= []
    if !params["is_form"] then
        params["is_equip"] = "on"  
        params["no_equip"] = "on" 
    end

    if params["is_equip"] == "on" && params["no_equip"] == "on" then params[:q]["equip_gteq_any"].push(0) end
    if params["is_equip"] == "on" && params["no_equip"] != "on" then params[:q]["equip_gteq_any"].push(1) end
    if params["is_equip"] != "on" && params["no_equip"] == "on" then params[:q]["equip_eq_any"].push(0) end

    @form_params["is_equip"] = params["is_equip"]
    @form_params["no_equip"] = params["no_equip"]

    params[:q][:g] = {}
    params[:q][:g]["0"] = {
        "g" => {
            "0" => {},
            "1" => {},
            "2" => {}
        },
        "m" => "and"
    }

    checkbox_params_set_query_any(params, @form_params, query_name: "kind_name_cont_any", params_q: params[:q][:g]["0"][:g]["0"],
                             checkboxes: [{params_name: "type_profit", value: "徳", first_checked: false},
                                          {params_name: "type_karma", value: "カルマ", first_checked: false},
                                          {params_name: "type_air", value: "虚空", first_checked: false},
                                          {params_name: "type_syura", value: "シュラ", first_checked: false}])

    checkbox_params_set_query_any(params, @form_params, query_name: "kind_name_cont_any", params_q: params[:q][:g]["0"][:g]["1"],
                             checkboxes: [{params_name: "type_guard", value: "護衛", first_checked: false},
                                          {params_name: "type_trap", value: "罠", first_checked: false},
                                          {params_name: "type_architecture", value: "建築", first_checked: false}])

    checkbox_params_set_query_any(params, @form_params, query_name: "kind_name_cont_any", params_q: params[:q][:g]["0"][:g]["2"],
                             checkboxes: [{params_name: "type_physics", value: "物理", first_checked: false},
                                          {params_name: "type_cold", value: "冷気", first_checked: false},
                                          {params_name: "type_seima", value: "聖魔", first_checked: false},
                                          {params_name: "type_electric", value: "電撃", first_checked: false},
                                          {params_name: "type_flame", value: "火炎", first_checked: false}])

    @base_first    = (!params["is_form"]) ? "1" : "0"
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_1", first_opened: true)
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_2")
  end
  # GET /items/1
  #def show
  #end

  # GET /items/new
  #def new
  #  @item = Item.new
  #end

  # GET /items/1/edit
  #def edit
  #end

  # POST /items
  #def create
  #  @item = Item.new(item_params)

  #  if @item.save
  #    redirect_to @item, notice: 'Item was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /items/1
  #def update
  #  if @item.update(item_params)
  #    redirect_to @item, notice: 'Item was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /items/1
  #def destroy
  #  @item.destroy
  #  redirect_to items_url, notice: 'Item was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:result_no, :generate_no, :e_no, :i_no, :name, :kind_id, :unique_1, :unique_2, :value, :invation, :encount, :technic, :goodwill, :intelligence, :stock, :add_effect_id, :strength, :equip, :fuka_1_id, :fuka_2_id, :orig_name_id)
    end
end
