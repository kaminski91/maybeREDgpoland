class MadeInGsController < ApplicationController
  before_action :set_made_in_g, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /made_in_gs
  # GET /made_in_gs.json
  def index
    @made_in_gs = MadeInG.all
  end

  # GET /made_in_gs/1
  # GET /made_in_gs/1.json
  def show
  end

  # GET /made_in_gs/new
  def new
    @made_in_g = MadeInG.new
  end

  # GET /made_in_gs/1/edit
  def edit
  end

  # POST /made_in_gs
  # POST /made_in_gs.json
  def create
    @made_in_g = MadeInG.new(made_in_g_params)

    respond_to do |format|
      if @made_in_g.save
        format.html { redirect_to @made_in_g, notice: 'Made in g was successfully created.' }
        format.json { render :show, status: :created, location: @made_in_g }
      else
        format.html { render :new }
        format.json { render json: @made_in_g.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /made_in_gs/1
  # PATCH/PUT /made_in_gs/1.json
  def update
    respond_to do |format|
      if @made_in_g.update(made_in_g_params)
        format.html { redirect_to @made_in_g, notice: 'Made in g was successfully updated.' }
        format.json { render :show, status: :ok, location: @made_in_g }
      else
        format.html { render :edit }
        format.json { render json: @made_in_g.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /made_in_gs/1
  # DELETE /made_in_gs/1.json
  def destroy
    @made_in_g.destroy
    respond_to do |format|
      format.html { redirect_to made_in_gs_url, notice: 'Made in g was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_made_in_g
      @made_in_g = MadeInG.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def made_in_g_params
      params.require(:made_in_g).permit(:content, :img)
    end
end
