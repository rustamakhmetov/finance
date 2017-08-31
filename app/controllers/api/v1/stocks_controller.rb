class Api::V1::StocksController < Api::V1::BaseController
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
    #respond_with :api, :v1, Stock.create(stock_params)
    #respond_with Stock.create(stock_params)
  end
  #
  # def destroy
  #   respond_with Item.destroy(params[:id])
  # end
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
end
