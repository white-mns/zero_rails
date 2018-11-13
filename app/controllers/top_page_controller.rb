class TopPageController < ApplicationController
  def index
    @last_result = Name.maximum('result_no')
    @last_generate = Name.where(result_no: @last_result).maximum('generate_no')
  end
end
