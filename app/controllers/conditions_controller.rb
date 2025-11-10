class ConditionsController < ApplicationController
  include MyUtility
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  # GET /conditions
  def index
    param_set
    @count	= Condition.notnil().includes(:pc_name, :condition).ransack(params[:q]).result.count()
    @search	= Condition.notnil().includes(:pc_name, :condition).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @conditions	= @search.result.per(50)
  end

  def param_set
    @latest_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    reference_text_assign(params, "pc_name_name", "pc_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_text_assign(params, "condition_name", "condition_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @condition_form = params["condition_form"]
  end
  # GET /conditions/1
  #def show
  #end

  # GET /conditions/new
  #def new
  #  @condition = Condition.new
  #end

  # GET /conditions/1/edit
  #def edit
  #end

  # POST /conditions
  #def create
  #  @condition = Condition.new(condition_params)

  #  if @condition.save
  #    redirect_to @condition, notice: 'Condition was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /conditions/1
  #def update
  #  if @condition.update(condition_params)
  #    redirect_to @condition, notice: 'Condition was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /conditions/1
  #def destroy
  #  @condition.destroy
  #  redirect_to conditions_url, notice: 'Condition was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def condition_params
      params.require(:condition).permit(:result_no, :generate_no, :e_no, :condition_id)
    end
end
