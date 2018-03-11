class FacultadesController < ApplicationController
  before_action :set_facultade, only: [:show, :edit, :update, :destroy]

  # GET /facultades
  # GET /facultades.json
  def index
    @facultades = Facultade.all
  end

  # GET /facultades/1
  # GET /facultades/1.json
  def show
  end

  # GET /facultades/new
  def new
    @facultade = Facultade.new
  end

  # GET /facultades/1/edit
  def edit
  end

  # POST /facultades
  # POST /facultades.json
  def create
    @facultade = Facultade.new(facultade_params)

    respond_to do |format|
      if @facultade.save
        format.html { redirect_to @facultade, notice: 'Facultade was successfully created.' }
        format.json { render :show, status: :created, location: @facultade }
      else
        format.html { render :new }
        format.json { render json: @facultade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facultades/1
  # PATCH/PUT /facultades/1.json
  def update
    respond_to do |format|
      if @facultade.update(facultade_params)
        format.html { redirect_to @facultade, notice: 'Facultade was successfully updated.' }
        format.json { render :show, status: :ok, location: @facultade }
      else
        format.html { render :edit }
        format.json { render json: @facultade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facultades/1
  # DELETE /facultades/1.json
  def destroy
    @facultade.destroy
    respond_to do |format|
      format.html { redirect_to facultades_url, notice: 'Facultade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facultade
      @facultade = Facultade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facultade_params
      params.require(:facultade).permit(:nombre, :observaciones, :estado, :borrado)
    end
end
