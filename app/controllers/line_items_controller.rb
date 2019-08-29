class LineItemsController < ApplicationController
    before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_item = LineItem.page(params[:page]).per Settings.num
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to( t("./"), :notice => t(".notice") }
        format.js
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @line_item.update(line_item_params)
      flash[:success] = t(".success_edit")
      redirect_to @line_item
    else
      render :edit
    end
  end

  def destroy
    @line_item.destroy
    if @product.destroy
      flash[:success] = t(".delete_s")
    else
      flash[:danger] = t(".delete_err")
    end
    redirect_to line_item_url
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
