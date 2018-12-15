class TopPageController < ApplicationController
  def index
    @latest_result = Name.maximum('result_no')
    @last_generate = Name.where(result_no: @latest_result).maximum('generate_no')
  end
end
