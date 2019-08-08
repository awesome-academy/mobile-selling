class ProductsController < ApplicationController
  before_action :load_product, except: %i(new create edit update index)

  def index
    @product = Product.page(params[:page]).per Settings.num
  end

  def show; end

  def new
    @product = Product.new
    @catergories = Catergory.all
  end

  def edit; end

  def create
    @product = Product.create product_params
     if @product.save
      flash[:success] = t(".success_create")
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update product_params
      flash[:success] = t(".success_edit")
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t(".delete_s")
    else
      flash[:danger] = t(".delete_err")
    end
    redirect_to products_url
  end

  private
    def product_params
      params.require(:product).permit Product::PRODUCT_PARAMS
    end

    def load_product
      @product = Product.find_by id: params[:id]
      return if @product
      flash[:danger] = t(".not_exits")
      redirect_to products_path
    end
end
