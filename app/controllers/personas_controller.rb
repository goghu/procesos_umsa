class PersonasController < ApplicationController

  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.where(borrado: nil).limit(20)
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html {redirect_to personas_url, notice: 'Persona was successfully created.'}
        format.json {render :show, status: :created, location: @persona}
      else
        format.html {render :new}
        format.json {render json: @persona.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html {redirect_to personas_url, notice: 'Persona was successfully updated.'}
        format.json {render :show, status: :ok, location: @persona}
      else
        format.html {render :edit}
        format.json {render json: @persona.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    idPer = params[:id]
    person = Persona.find(idPer)
    person.borrado = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    person.save
    respond_to do |format|
      format.html {redirect_to personas_url, notice: 'La Persona fue eliminado correctamente'}
      format.json {head :no_content}
    end


  end

  def solodocentes
    @solodocentes = Persona.where(tipo: "Docente")
  end

  def solouniversitarios
    @nombre = Persona.where(tipo: "Estudiante")
  end

  def soloasesores
    @nombre = Persona.where(tipo: "Asesor")
  end

  def emisioncertf
    @nombre = Persona.where(tipo:"Emisioncertf")
  end

  def fallo
    @nombre = Persona.where(tipo:"fallo")
  end

  def impresion
    persona_ci = params[:persona_ci]
    #@datos_denuncia = Denuncium.where("persona_id = ?", id_persona)
    @datos_persona = Persona.where("persona_ci =?", id_persona).last
    # byebug
    respond_to do |format|
      format.html { @datos_persona }
      format.json { render json: @datos_persona }
    end
  end

  def b_ci_ajax
   ci_buscar = params[:ci]
   @datos_persona = Persona.where("ci like ?",  "%#{ci_buscar}%")
   respond_to do |format|
   format.html { @datos_persona }
   format.json { render json: @datos_persona }
  end
end


=begin
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
=end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_persona
    @persona = Persona.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def persona_params
    params.require(:persona).permit(:item, :ci, :nombre, :facultad, :carrera, :tipo, :categoria, :borrado)
  end

  def jquery
    
  end

end
