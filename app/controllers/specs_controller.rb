class SpecsController < ApplicationController
  include MyUtility
  before_action :set_spec, only: [:show, :edit, :update, :destroy]

  # GET /specs
  def index
    param_set
    @count	= Spec.notnil().includes(:pc_name, [regalia: :regalia], [condition: :condition]).search(params[:q]).result.count()
    @search	= Spec.notnil().includes(:pc_name, [regalia: :regalia], [condition: :condition]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @specs	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "pc_name_name", "pc_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "invation", "invation_form")
    reference_number_assign(params, "encount", "encount_form")
    reference_number_assign(params, "technic", "technic_form")
    reference_number_assign(params, "goodwill", "goodwill_form")
    reference_number_assign(params, "intelligence", "intelligence_form")
    reference_number_assign(params, "drink", "drink_form")
    reference_number_assign(params, "illegality", "illegality_form")
    reference_text_assign(params, "regalia_regalia_name", "regalia_form")
    reference_text_assign(params, "condition_condition_name", "condition_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @invation_form = params["invation_form"]
    @encount_form = params["encount_form"]
    @technic_form = params["technic_form"]
    @goodwill_form = params["goodwill_form"]
    @intelligence_form = params["intelligence_form"]
    @drink_form = params["drink_form"]
    @illegality_form = params["illegality_form"]
    
    @regalia_form = params["regalia_form"]
    @condition_form = params["condition_form"]
    
    @show_detail_1 = (!params["is_form"]) ? "1" : params["show_detail_1"]
    @show_detail_2 = (!params["is_form"]) ? "1" : params["show_detail_2"]
    @show_condition = params["show_condition"]
    @base_first    = (!params["is_form"]) ? "1" : "0"
  end
  # GET /specs/1
  #def show
  #end

  # GET /specs/new
  #def new
  #  @spec = Spec.new
  #end

  # GET /specs/1/edit
  #def edit
  #end

  # POST /specs
  #def create
  #  @spec = Spec.new(spec_params)

  #  if @spec.save
  #    redirect_to @spec, notice: 'Spec was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /specs/1
  #def update
  #  if @spec.update(spec_params)
  #    redirect_to @spec, notice: 'Spec was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /specs/1
  #def destroy
  #  @spec.destroy
  #  redirect_to specs_url, notice: 'Spec was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spec_params
      params.require(:spec).permit(:result_no, :generate_no, :e_no, :invation, :encount, :technic, :goodwill, :intelligence, :drink, :illegality)
    end
end
