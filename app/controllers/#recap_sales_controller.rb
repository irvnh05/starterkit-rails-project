class RecapSalesController < ApplicationController
  before_action :set_recap_sale, only: %i[ show edit update destroy ]

  # GET /recap_sales or /recap_sales.json
  def index
    @recap_sales = RecapSale.all
  end

  # GET /recap_sales/1 or /recap_sales/1.json
  def show
  end

  # GET /recap_sales/new
  def new
    @recap_sale = RecapSale.new
  end

  # GET /recap_sales/1/edit
  def edit
  end

  # POST /recap_sales or /recap_sales.json
  def create
    @recap_sale = RecapSale.new(recap_sale_params)

    respond_to do |format|
      if @recap_sale.save
        format.html { redirect_to recap_sale_url(@recap_sale), notice: "Recap sale was successfully created." }
        format.json { render :show, status: :created, location: @recap_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recap_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recap_sales/1 or /recap_sales/1.json
  def update
    respond_to do |format|
      if @recap_sale.update(recap_sale_params)
        format.html { redirect_to recap_sale_url(@recap_sale), notice: "Recap sale was successfully updated." }
        format.json { render :show, status: :ok, location: @recap_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recap_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recap_sales/1 or /recap_sales/1.json
  def destroy
    @recap_sale.destroy

    respond_to do |format|
      format.html { redirect_to recap_sales_url, notice: "Recap sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recap_sale
      @recap_sale = RecapSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recap_sale_params
      params.fetch(:recap_sale, {})
    end
end
