class ItemsController < ApplicationController
  include MyUtility
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    param_set
    @count	= Item.notnil().includes(:pc_name).search(params[:q]).result.count()
    @search	= Item.notnil().includes(:pc_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @items	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')

    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "pc_name_name", "pc_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "i_no", "i_no_form")
    reference_number_assign(params, "name", "name_form")
    reference_number_assign(params, "kind_id", "kind_id_form")
    reference_number_assign(params, "unique_1", "unique_1_form")
    reference_number_assign(params, "unique_2", "unique_2_form")
    reference_number_assign(params, "value", "value_form")
    reference_number_assign(params, "invation", "invation_form")
    reference_number_assign(params, "encount", "encount_form")
    reference_number_assign(params, "technic", "technic_form")
    reference_number_assign(params, "goodwill", "goodwill_form")
    reference_number_assign(params, "intelligence", "intelligence_form")
    reference_number_assign(params, "stock", "stock_form")
    reference_number_assign(params, "add_effect_id", "add_effect_id_form")
    reference_number_assign(params, "strength", "strength_form")
    reference_number_assign(params, "equip", "equip_form")
    reference_number_assign(params, "fuka_1_id", "fuka_1_id_form")
    reference_number_assign(params, "fuka_2_id", "fuka_2_id_form")
    reference_number_assign(params, "orig_name_id", "orig_name_id_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @i_no_form = params["i_no_form"]
    @name_form = params["name_form"]
    @kind_id_form = params["kind_id_form"]
    @unique_1_form = params["unique_1_form"]
    @unique_2_form = params["unique_2_form"]
    @value_form = params["value_form"]
    @invation_form = params["invation_form"]
    @encount_form = params["encount_form"]
    @technic_form = params["technic_form"]
    @goodwill_form = params["goodwill_form"]
    @intelligence_form = params["intelligence_form"]
    @stock_form = params["stock_form"]
    @add_effect_id_form = params["add_effect_id_form"]
    @strength_form = params["strength_form"]
    @equip_form = params["equip_form"]
    @fuka_1_id_form = params["fuka_1_id_form"]
    @fuka_2_id_form = params["fuka_2_id_form"]
    @orig_name_id_form = params["orig_name_id_form"]
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
