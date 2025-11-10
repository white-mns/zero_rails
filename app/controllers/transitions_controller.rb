class TransitionsController < ApplicationController
  include MyUtility
  before_action :set_transition, only: [:show, :edit, :update, :destroy]

  # GET /transitions
  def index
    placeholder_set
    param_set
    @count	= Transition.notnil().includes(:pc_name).ransack(params[:q]).result.count()
    @search	= Transition.notnil().includes(:pc_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @transitions	= @search.result.per(50)
  end
  
  # GET /transition/graph
  def graph
    if !params["is_form"] then
        params["block_no_form"] = "1"
    end
    placeholder_set
    param_set
    @search	= Transition.notnil().includes(:p_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @library_param = {
        interpolateNulls: true
    }
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum('result_no')

    @data_type = {
        1 => "攻撃",
        2 => "支援",
        3 => "防衛",
        4 => "売上",
        5 => "捕虜"
    }

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    params_to_form(params, @form_params, column_name: "pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "block_no", params_name: "block_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "turn", params_name: "turn_form", type: "number")
    params_to_form(params, @form_params, column_name: "turn", params_name: "turn_form", type: "number")
    params_to_form(params, @form_params, column_name: "acted_at", params_name: "acted_at_form", type: "number")
    params_to_form(params, @form_params, column_name: "act", params_name: "act_form", type: "number")
    params_to_form(params, @form_params, column_name: "data_type", params_name: "data_type_form", type: "number")
    params_to_form(params, @form_params, column_name: "value", params_name: "value_form", type: "number")
 
    params_to_form(params, @form_params, column_name: "pc_name_nickname", params_name: "nickname_form", type: "text")

    checkbox_params_set_query_any(params, @form_params, query_name: "data_type_eq_any",
                             checkboxes: [{params_name: "type_attack",   value: 1, first_checked: false},
                                          {params_name: "type_support",  value: 2, first_checked: false},
                                          {params_name: "type_defense",  value: 3, first_checked: false},
                                          {params_name: "type_sales",    value: 4, first_checked: false},
                                          {params_name: "type_prisoner", value: 5, first_checked: false}])
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
      params.require(:transition).permit(:result_no, :generate_no, :block_no, :e_no, :turn, :acted_at, :act, :data_type, :value)
    end
end
