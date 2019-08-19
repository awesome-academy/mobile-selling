class HomePageController < ApplicationController
  def index
        @product = Product.page(params[:page]).per Settings.num

  end
end
