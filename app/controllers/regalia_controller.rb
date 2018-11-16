class RegaliaController < ApplicationController
  include MyUtility
  before_action :set_regalium, only: [:show, :edit, :update, :destroy]

  # GET /regalia
  def index
    param_set
    @count	= Regalium.notnil().includes(:pc_name, :regalia).search(params[:q]).result.count()
    @search	= Regalium.notnil().includes(:pc_name, :regalia).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @regalia	= @search.result.per(50)
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
    reference_text_assign(params, "regalia_name", "regalia_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @regalia_form = params["regalia_form"]
  end
  # GET /regalia/1
  #def show
  #end

  # GET /regalia/new
  #def new
  #  @regalium = Regalium.new
  #end

  # GET /regalia/1/edit
  #def edit
  #end

  # POST /regalia
  #def create
  #  @regalium = Regalium.new(regalium_params)

  #  if @regalium.save
  #    redirect_to @regalium, notice: 'Regalium was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /regalia/1
  #def update
  #  if @regalium.update(regalium_params)
  #    redirect_to @regalium, notice: 'Regalium was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /regalia/1
  #def destroy
  #  @regalium.destroy
  #  redirect_to regalia_url, notice: 'Regalium was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regalium
      @regalium = Regalium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def regalium_params
      params.require(:regalium).permit(:result_no, :generate_no, :e_no, :regalia_id)
    end
end
