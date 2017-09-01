class Api::V1::StocksController < Api::V1::BaseController

  before_action :load_stock, only: %i(destroy reload)

  def index
    respond_with Stock.all
  end

  def create
    stock = Stock.create(stock_params)
    if stock.errors.empty?
      render json: stock
    else
      render json: {errors: stock.errors}.to_json, status: 422
    end
  end

  def destroy
    @stock.destroy
    head :ok
  end

  def reload
    render json: {url: Service.authorization_url}.to_json
  end
  #
  # def update
  #   item = Item.find(params["id"])
  #   item.update_attributes(item_params)
  #   respond_with item, json: item
  # end

  # def finance
  #
  # end
  #
  private

  def stock_params
    params.require(:stock).permit(:name)
  end

  def load_stock
    @stock = Stock.find_by_id(params[:id])
    raise Errors::UnprocessableEntity, "Stock not exists" unless @stock
  end
end
