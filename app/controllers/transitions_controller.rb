class TransitionsController < ApplicationController
  include MyUtility
  before_action :set_transition, only: [:show, :edit, :update, :destroy]

  # GET /transitions
  def index
    param_set
    @count	= Transition.notnil().includes(:pc_name).search(params[:q]).result.count()
    @search	= Transition.notnil().includes(:pc_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @transitions	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')

    @data_type = {
        1 => "攻撃",
        2 => "支援",
        3 => "防衛"
    }

    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "pc_name_name", "pc_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "block_no", "block_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "turn", "turn_form")
    reference_number_assign(params, "act", "act_form")
    reference_number_assign(params, "data_type", "data_type_form")
    reference_number_assign(params, "value", "value_form")
 
    reference_text_assign(params, "pc_name_nickname", "nickname_form")
    
    params[:q]["data_type_eq_any"] ||= []
    if !params["is_form"] then
        params["type_attack"]  = "on"  
        params["type_support"] = "on" 
        params["type_defense"] = "on" 
    end

    if params["type_attack"]  == "on" then params[:q]["data_type_eq_any"].push(1) end
    if params["type_support"] == "on" then params[:q]["data_type_eq_any"].push(2) end
    if params["type_defense"] == "on" then params[:q]["data_type_eq_any"].push(3) end
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @block_no_form = params["block_no_form"]
    @e_no_form = params["e_no_form"]
    @turn_form = params["turn_form"]
    @act_form = params["act_form"]
    @data_type_form = params["data_type_form"]
    @value_form = params["value_form"]
    
    @type_attack = params["type_attack"]
    @type_support = params["type_support"]
    @type_defense = params["type_defense"]

    @nickname_form = params["nickname_form"]
  end
  # GET /transitions/1
  #def show
  #end

  # GET /transitions/new
  #def new
  #  @transition = Transition.new
  #end

  # GET /transitions/1/edit
  #def edit
  #end

  # POST /transitions
  #def create
  #  @transition = Transition.new(transition_params)

  #  if @transition.save
  #    redirect_to @transition, notice: 'Transition was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /transitions/1
  #def update
  #  if @transition.update(transition_params)
  #    redirect_to @transition, notice: 'Transition was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /transitions/1
  #def destroy
  #  @transition.destroy
  #  redirect_to transitions_url, notice: 'Transition was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transition
      @transition = Transition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transition_params
      params.require(:transition).permit(:result_no, :generate_no, :block_no, :e_no, :turn, :act, :data_type, :value)
    end
end
