class ImpresosController < ApplicationController
  before_action :set_impreso, only: [:show, :edit, :update, :destroy]

  # GET /impresos
  # GET /impresos.json
  def index
    @impresos = Impreso.all
  end

  # GET /impresos/1
  # GET /impresos/1.json
  def show
  end

  # GET /impresos/new
  def new
    @impreso = Impreso.new
  end

  # GET /impresos/1/edit
  def edit
  end

  def new
    @impresion = Impresos.new
  end

  # POST /impresos
  # POST /impresos.json
  def create
    @impreso = Impreso.new(impreso_params)

    respond_to do |format|
      if @impreso.save
        format.html { redirect_to @impreso, notice: 'Impreso was successfully created.' }
        format.json { render :show, status: :created, location: @impreso }
      else
        format.html { render :new }
        format.json { render json: @impreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impresos/1
  # PATCH/PUT /impresos/1.json
  def update
    respond_to do |format|
      if @impreso.update(impreso_params)
        format.html { redirect_to @impreso, notice: 'Impreso was successfully updated.' }
        format.json { render :show, status: :ok, location: @impreso }
      else
        format.html { render :edit }
        format.json { render json: @impreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impresos/1
  # DELETE /impresos/1.json
  def destroy
    @impreso.destroy
    respond_to do |format|
      format.html { redirect_to impresos_url, notice: 'Impreso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def emision
    @nombre = Impreso.where(tipo: "Emision" )
  end

  def bu_ci_ajax
  # ci_buscar = params[:ci]
  # @datos_persona = Persona.where("ci like ?",  "%#{ci_buscar}%")
  # respond_to do |format|
  #   format.html { @datos_persona }
  #   format.json { render json: @datos_persona }
  end

  def reporte
    
  end

  def genera_reporte
    # byebug
    fecha_ini = params[:reporte][:fecha_inicial].to_datetime
    fecha_f = params[:reporte][:fecha_final].to_datetime
    @listado_grupales = Egrupal.where('created_at BETWEEN ? AND ?', fecha_ini.beginning_of_day, fecha_f.end_of_day)
    @listado_individuales = Impreso.where('created_at BETWEEN ? AND ?', fecha_ini.beginning_of_day, fecha_f.end_of_day)
    # byebug
    # byebug
    # Impreso.select(:presona_id).distinct.where('created_at BETWEEN ? AND ?', params[:reporte][:fecha_inicial].beginning_of_day, params[:reporte][:fecha_inicial].end_of_day)
    # listado_impresos = Impreso.select("impresos.correlt_certf, impresos.created_at").where("DATE(impresos.created_at) >= ? AND DATE(impresos.created_at) <= ?", params[:reporte][:fecha_inicial], params[:reporte][:fecha_inicial])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impreso
      #@impreso = Impreso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impreso_params
      params.require(:impreso).permit(:personas_id, :denuncium_id, :user_id, :numero)
    end
end
