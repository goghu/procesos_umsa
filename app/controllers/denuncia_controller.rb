class DenunciaController < ApplicationController
  before_action :set_denuncium, only: [:show, :edit, :update, :destroy]

  # GET /denuncia
  # GET /denuncia.json
  def index
    @denuncia = Denuncium.all
  end

  # GET /denuncia/1
  # GET /denuncia/1.json
  def show
  end

  # GET /denuncia/new
  def new
    @denuncium = Denuncium.new

  end

  # GET /denuncia/1/edit
  def edit
  end

  # POST /denuncia
  # POST /denuncia.json
  def create
    @denuncium = Denuncium.new(denuncium_params)

    respond_to do |format|
      if @denuncium.save
        format.html { redirect_to @denuncium, notice: 'Denuncium was successfully created.' }
        format.json { render :show, status: :created, location: @denuncium }
      else
        format.html { render :new }
        format.json { render json: @denuncium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /denuncia/1
  # PATCH/PUT /denuncia/1.json
  def update
    respond_to do |format|
      if @denuncium.update(denuncium_params)
        format.html { redirect_to @denuncium, notice: 'Denuncium was successfully updated.' }
        format.json { render :show, status: :ok, location: @denuncium }
      else
        format.html { render :edit }
        format.json { render json: @denuncium.errors, status: :unprocessable_entity }
      end
    end
  end

  def impresion
    id_persona = params[:id_persona]
    #@datos_denuncia = Denuncium.where("persona_id = ?", id_persona)
    @datos_denuncia = Denuncium.where("persona_id =?", id_persona).last
    # byebug
    respond_to do |format|
      format.html { @datos_denuncia }
      format.json { render json: @datos_denuncia }
    end
  end

  def busca_ci_ajax
    ci_buscar = params[:ci]
    @datos_persona = Persona.where("ci like ?",  "%#{ci_buscar}%")
    respond_to do |format|
      format.html { @datos_persona }
      format.json { render json: @datos_persona }
    end
    render layout: false
  end

  # DELETE /denuncia/1
  # DELETE /denuncia/1.json
  def destroy
    @denuncium.destroy
    respond_to do |format|
      format.html { redirect_to denuncia_url, notice: 'Denuncium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_denuncium
      @denuncium = Denuncium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def denuncium_params
      params.require(:denuncium).permit(:tipo_pe_persona, :nombre, :ci, :ru_item, :fecha, :facultad_id, :carrera_id, :tipo_resol, :codigo_caso, :direccion, :telefono, :observaciones, :fallo)
    end
end
