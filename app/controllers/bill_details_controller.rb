class BillDetailsController < ApplicationController
 before_action :set_bill_detail, only: [:show, :edit, :update, :destroy]

    # GET /line_items
    # GET /line_items.json
    def index
        @bill_detail = BillDetail.all
    end

    # GET /line_items/1
    # GET /line_items/1.json
    def show
    end

    # GET /line_items/new
    def new
    end

    # GET /line_items/1/edit
    def edit
    end

    # POST /line_items
    # POST /line_items.json
    def create
      @cart = current_cart
      product = Product.find(params[:product_id])
      @bill_detail = @cart.bill_details.build(:product => product)

      respond_to do |format|
        if @bill_detail.save
          format.html { redirect_to(@bill_detail.cart, :notice => 'Line item was successfully created') }
          format.json { render :show, status: :created, location: @bill_detail }
        else
          format.html { render :new }
          format.json { render json: @bill_detail.errors, status: :unprocessable_entity }
          end
        end
    end

    # PATCH/PUT /line_items/1
    # PATCH/PUT /line_items/1.json
    def update
        respond_to do |format|
            if @bill_detail.update(bill_detail_params)
                format.html { redirect_to @bill_detail, notice: 'Line item was successfully updated.' }
                format.json { render :show, status: :ok, location: @bill_detail }
            else
                format.html { render :edit }
                format.json { render json: @bill_detail.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /line_items/1
    # DELETE /line_items/1.json
    def destroy
        @bill_detail.destroy
        respond_to do |format|
            format.html { redirect_to bill_details_url, notice: 'Line item was successfully destroyed.' }
           format.json { head :no_content }
        end
    end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_detail
        @bill_detail = BillDetail.find(params[:id])
    end

# Never trust parameters from the scary internet, only allow the white list through.
    def bill_detail_params
        params.require(:bill_detail).permit( :amout, :payment_method, :price, :product_id, :cart_id)
    end
end
