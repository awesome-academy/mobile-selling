class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = []
      if session[:cart_id] != nil
        @carts << Cart.find_by_id(session[:cart_id])
      end
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def edit; end

  def add_cart
    id = params["product_id"]
  end

  def create
    @cart = current_cart
    if @cart.save
      flash[:success] = t(".success_create")
      redirect_to @cart
    else
      render :new
    end
  end

  def update
    if @cart.update(cart_params)
      flash[:success] = t(".success_edit")
      redirect_to @cart
    else
      render :edit
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    if @cart.destroy
      flash[:success] = t(".delete_s")
    else
      flash[:danger] = t(".delete_err")
    end
    redirect_to products_url
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.fetch(:cart, {})
    end
end
