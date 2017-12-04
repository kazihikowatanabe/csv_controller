class CsvControllerController < ApplicationController
  def import2
		Stock.import(params[:file])
		redirect_to show_url, notice:'データを追加しました'
  end

  def show
		@stocks = Stock.all
  end
end
