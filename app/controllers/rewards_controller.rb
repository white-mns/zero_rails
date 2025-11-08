class RewardsController < ApplicationController
  include MyUtility
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  # GET /rewards
  def index
    param_set
    @count	= Reward.notnil().includes(:pc_name, :reward).ransack(params[:q]).result.count()
    @search	= Reward.notnil().includes(:pc_name, :reward).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @rewards	= @search.result.per(50)
  end

  # GET /reward/graph
  def graph
      index
      @library_param =  {backgroundColor: "#222",
            vAxis: { baselineColor: "#F76161", textStyle: { color: "#eee"}, titleTextStyle: {color: "#eee"} },
            hAxis: { baselineColor: "#F76161", textStyle: { color: "#eee"}, titleTextStyle: {color: "#eee"} }}
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
    reference_text_assign(params, "reward_name", "reward_type_form")
    reference_number_assign(params, "value", "value_form")
    
    @pc_name_form = params["pc_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @reward_type_form = params["reward_type_form"]
    @value_form = params["value_form"]
  end
  # GET /rewards/1
  #def show
  #end

  # GET /rewards/new
  #def new
  #  @reward = Reward.new
  #end

  # GET /rewards/1/edit
  #def edit
  #end

  # POST /rewards
  #def create
  #  @reward = Reward.new(reward_params)

  #  if @reward.save
  #    redirect_to @reward, notice: 'Reward was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /rewards/1
  #def update
  #  if @reward.update(reward_params)
  #    redirect_to @reward, notice: 'Reward was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /rewards/1
  #def destroy
  #  @reward.destroy
  #  redirect_to rewards_url, notice: 'Reward was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reward_params
      params.require(:reward).permit(:result_no, :generate_no, :e_no, :reword_type_id, :value)
    end
end
