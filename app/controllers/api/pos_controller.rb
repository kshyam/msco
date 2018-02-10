class Api::PosController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def cart
    status_code = 200
    
    result_hash = {}
    render json: result_hash.to_json
  end
end