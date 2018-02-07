class Admin::ApiRequestsController < AdminController

  def index
    # render json: result.to_json
    @samples_count = Sample.count
    @samples = Sample.all.order("id DESC").page(params[:page]).per(50)
  end
end