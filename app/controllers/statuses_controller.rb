class StatusesController < ApplicationController
  include MyUtility
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses
  def index
    param_set
    @count	= Status.notnil().includes(:pc_name).search(params[:q]).result.count()
    @search	= Status.notnil().includes(:pc_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @statuses	= @search.result.per(50)
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
    reference_number_assign(params, "ranking_rate", "ranking_rate_form")
    reference_number_assign(params, "rp", "rp_form")
    reference_number_assign(params, "acc_total", "acc_total_form")
    reference_number_assign(params, "acc_attack", "acc_attack_form")
    reference_number_assign(params, "acc_support", "acc_support_form")
    reference_number_assign(params, "acc_defense", "acc_defense_form")
    reference_number_assign(params, "funds", "funds_form")
    reference_number_assign(params, "exp", "exp_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @ranking_rate_form = params["ranking_rate_form"]
    @rp_form = params["rp_form"]
    @acc_total_form = params["acc_total_form"]
    @acc_attack_form = params["acc_attack_form"]
    @acc_support_form = params["acc_support_form"]
    @acc_defense_form = params["acc_defense_form"]
    @funds_form = params["funds_form"]
    @exp_form = params["exp_form"]
  end
  # GET /statuses/1
  #def show
  #end

  # GET /statuses/new
  #def new
  #  @status = Status.new
  #end

  # GET /statuses/1/edit
  #def edit
  #end

  # POST /statuses
  #def create
  #  @status = Status.new(status_params)

  #  if @status.save
  #    redirect_to @status, notice: 'Status was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /statuses/1
  #def update
  #  if @status.update(status_params)
  #    redirect_to @status, notice: 'Status was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /statuses/1
  #def destroy
  #  @status.destroy
  #  redirect_to statuses_url, notice: 'Status was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:result_no, :generate_no, :e_no, :ranking_rate, :rp, :acc_total, :acc_attack, :acc_support, :acc_defense, :funds, :exp)
    end
end
