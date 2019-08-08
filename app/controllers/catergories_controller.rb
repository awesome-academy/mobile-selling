class CatergoriesController < ApplicationController
  before_action :load_catergory, except: %i(new create update destroy index)

  def index
    @catergory = Catergory.page(params[:page]).per Settings.num
  end

  def show; end

  def new
    @catergory = Catergory.new
  end

  def edit; end

  def create
    @catergory = Catergory.new catergory_params
    if @catergory.save
      flash[:success] = t(".success_create")
      redirect_to @catergory
    else
      render :new
    end
  end

  def update
    if @catergory.update catergory_params
      flash[:success] = t(".success_edit")
      redirect_to @catergory
    else
      render :edit
    end
  end

  def destroy
    if @catergory.destroy
      flash[:success] = t(".delete_s")
    else
      flash[:danger] = t(".delete_err")
    end
    redirect_to catergories_url
  end

  private

    def catergory_params
      params.require(:catergory).permit(:name)
    end

    def load_catergory
      @catergory = Catergory.find_by id: params[:id]
      return if @catergory
      flash[:danger] = t(".not_exits")
      redirect_to catergories_path
    end
end
