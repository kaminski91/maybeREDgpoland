class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = Portfolio.all
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' } # change path later
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def down
    @actual = Portfolio.find_by(np: params[:np])
    max_order = Portfolio.all.order(:np).last.np

    if @actual.np < max_order
      tmp_np = @actual.np
      @actual.update np: max_order + 1
      Portfolio.find_by(np: tmp_np + 1).update np: tmp_np
      @actual.update np: tmp_np + 1
    end

    redirect_to portfolios_path
  end

  def up
    @actual = Portfolio.find_by(np: params[:np])
    max_order = Portfolio.all.order(:np).last.np

    if @actual.np > 1
      tmp_np = @actual.np
      @actual.update np: max_order - 1
      Portfolio.find_by(np: tmp_np - 1).update np: tmp_np
      @actual.update np: tmp_np - 1
    end
    
    redirect_to portfolios_path
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title_pl, :content_pl, :title_en, :content_en, :title_it, :content_it, :brand, :img, :www)
    end
end
