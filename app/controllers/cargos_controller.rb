class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]

  # GET /cargos
  # GET /cargos.json
  def index
    @cargo = Cargo.where(borrado: nil)
  end

  # GET /cargos/1
  # GET /cargos/1.json
  def show
  end

  # GET /cargos/new
  def new
    @cargo = Cargo.new
  end

  # GET /cargos/1/edit
  def edit
  end

  # POST /cargos
  # POST /cargos.json
  def create
    @cargo = Cargo.new(cargo_params)

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to cargos_url, notice: 'El Cargo se creado correctamente.' }
        format.json { render :show, status: :created, location: @cargo }
      else
        format.html { render :new }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cargos/1
  # PATCH/PUT /cargos/1.json
  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        format.html { redirect_to cargos_url, notice: 'Cargo se edito con exito .' }
        format.json { render :show, status: :ok, location: @cargo }
      else
        format.html { render :edit }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargos/1
  # DELETE /cargos/1.json
  def destroy
    idCargo = params[:id]
    carg = Cargo.find(idCargo)
    carg.borrado = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    carg.save
    respond_to do |format|
      format.html { redirect_to cargos_url, notice: 'El cargo fue eliminado correctamente' }
      format.json { head :no_content }
    end

=begin
    @cargo.destroy
    respond_to do |format|
      format.html { redirect_to cargos_url, notice: 'Cargo was successfully destroyed.' }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cargo_params
      params.require(:cargo).permit(:nombre, :tipo, :borrado)
    end
end
