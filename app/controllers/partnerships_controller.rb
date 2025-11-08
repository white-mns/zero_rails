class PartnershipsController < ApplicationController
  include MyUtility
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]

  # GET /partnerships
  def index
    param_set
    @count	= Partnership.notnil().includes(:pc_name, :partnership).ransack(params[:q]).result.count()
    @search	= Partnership.notnil().includes(:pc_name, :partnership).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @partnerships	= @search.result.per(50)
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
    reference_number_assign(params, "partner_e_no", "partner_e_no_form")
    reference_text_assign(params, "partnership_name", "partner_name_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @partner_e_no_form = params["partner_e_no_form"]
    @partner_name_form = params["partner_name_form"]
  end
  # GET /partnerships/1
  #def show
  #end

  # GET /partnerships/new
  #def new
  #  @partnership = Partnership.new
  #end

  # GET /partnerships/1/edit
  #def edit
  #end

  # POST /partnerships
  #def create
  #  @partnership = Partnership.new(partnership_params)

  #  if @partnership.save
  #    redirect_to @partnership, notice: 'Partnership was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /partnerships/1
  #def update
  #  if @partnership.update(partnership_params)
  #    redirect_to @partnership, notice: 'Partnership was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /partnerships/1
  #def destroy
  #  @partnership.destroy
  #  redirect_to partnerships_url, notice: 'Partnership was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partnership
      @partnership = Partnership.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def partnership_params
      params.require(:partnership).permit(:result_no, :generate_no, :e_no, :partner_e_no)
    end
end
