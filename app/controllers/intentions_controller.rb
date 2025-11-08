class IntentionsController < ApplicationController
  include MyUtility
  before_action :set_intention, only: [:show, :edit, :update, :destroy]

  # GET /intentions
  def index
    param_set
    @count	= Intention.notnil().includes(:pc_name, :intention).ransack(params[:q]).result.count()
    @search	= Intention.notnil().includes(:pc_name, :intention).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @intentions	= @search.result.per(50)
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
    reference_text_assign(params, "intention_name", "intention_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @intention_form = params["intention_form"]
  end
  # GET /intentions/1
  #def show
  #end

  # GET /intentions/new
  #def new
  #  @intention = Intention.new
  #end

  # GET /intentions/1/edit
  #def edit
  #end

  # POST /intentions
  #def create
  #  @intention = Intention.new(intention_params)

  #  if @intention.save
  #    redirect_to @intention, notice: 'Intention was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /intentions/1
  #def update
  #  if @intention.update(intention_params)
  #    redirect_to @intention, notice: 'Intention was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /intentions/1
  #def destroy
  #  @intention.destroy
  #  redirect_to intentions_url, notice: 'Intention was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intention
      @intention = Intention.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def intention_params
      params.require(:intention).permit(:result_no, :generate_no, :e_no, :intention_id)
    end
end
