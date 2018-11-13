class AssemblyNumsController < ApplicationController
  include MyUtility
  before_action :set_assembly_num, only: [:show, :edit, :update, :destroy]

  # GET /assembly_nums
  def index
    param_set
    @count	= AssemblyNum.notnil().includes(:pc_name, :unit).search(params[:q]).result.count()
    @search	= AssemblyNum.notnil().includes(:pc_name, :unit).page(params[:page]).search(params[:q])
    @search.sorts = 'num desc' if @search.sorts.empty?
    @assembly_nums	= @search.result.per(50)
  end

  # GET /mega_assembles
  def mega_assemble
      index
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
    reference_number_assign(params, "division_type_id", "division_type_id_form")
    reference_text_assign(params, "unit_name", "unit_form")
    reference_number_assign(params, "num", "num_form")

    if !params["is_form"] then params["is_division_1"] = "on" end
    params[:q]["division_type_id_eq_any"] ||= []
    if params["is_division_0"] == "on" then params[:q]["division_type_id_eq_any"].push(0) end
    if params["is_division_1"] == "on" then params[:q]["division_type_id_eq_any"].push(1) end
    if params["is_division_2"] == "on" then params[:q]["division_type_id_eq_any"].push(2) end
    if params["is_division_3"] == "on" then params[:q]["division_type_id_eq_any"].push(3) end
    if params["is_division_4"] == "on" then params[:q]["division_type_id_eq_any"].push(4) end
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @division_type_id_form = params["division_type_id_form"]
    @unit_form = params["unit_form"]
    @num_form = params["num_form"]

    @is_division_0 = params["is_division_0"]
    @is_division_1 = params["is_division_1"]
    @is_division_2 = params["is_division_2"]
    @is_division_3 = params["is_division_3"]
    @is_division_4 = params["is_division_4"]
  end
  # GET /assembly_nums/1
  #def show
  #end

  # GET /assembly_nums/new
  #def new
  #  @assembly_num = AssemblyNum.new
  #end

  # GET /assembly_nums/1/edit
  #def edit
  #end

  # POST /assembly_nums
  #def create
  #  @assembly_num = AssemblyNum.new(assembly_num_params)

  #  if @assembly_num.save
  #    redirect_to @assembly_num, notice: 'Assembly num was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /assembly_nums/1
  #def update
  #  if @assembly_num.update(assembly_num_params)
  #    redirect_to @assembly_num, notice: 'Assembly num was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /assembly_nums/1
  #def destroy
  #  @assembly_num.destroy
  #  redirect_to assembly_nums_url, notice: 'Assembly num was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly_num
      @assembly_num = AssemblyNum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assembly_num_params
      params.require(:assembly_num).permit(:result_no, :generate_no, :e_no, :division_type_id, :proper_name_id, :num)
    end
end
