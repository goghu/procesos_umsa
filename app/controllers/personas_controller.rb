class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  # GET /personas
  # GET /personas.json
  def index
    # @personas = Persona.where(borrado: nil).limit(20)
    respond_to do |format|
      format.html
      format.json { render json: GenteDatatable.new(view_context) }
    end
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
        format.html { redirect_to personas_url, notice: "Persona was successfully created." }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to personas_url, notice: "Persona was successfully updated." }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    idPer = params[:id]
    person = Persona.find(idPer)
    person.borrado = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  person.nombre
    person.save
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'La Persona fue eliminado correctamente' }
      format.json { head :no_content }
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

  def usuarios
    # @nombre = Persona.where(tipo:"Usuario")
  end

  # fallo inicio buscador#
  def fallo
    # @nombre = Persona.where(tipo:"fallo")
  end

  def guarda_fallo
    # byebug
    # agarramos los datos del array de persona
    datos_form_persona = params[:persona]

    # capturamos los datos para guardar
    # ci_persona = datos_form_persona[:ci]
    fallo = datos_form_persona[:fallo]
    id_per = datos_form_persona[:id]
    obs = datos_form_persona[:observaciones]
    rev_inic = datos_form_persona[:rev_inic]
    no_inf = datos_form_persona[:no_inf]
    fecha = datos_form_persona[:fecha]
    codigo_caso = datos_form_persona[:codigo_caso]
    tipo_resol = datos_form_persona[:tipo_resol]
    h_ruta = datos_form_persona[:h_ruta]
    # guardamos la nueva denuncia
    nueva_denuncia = Denuncium.new
    nueva_denuncia.fallo = fallo
    nueva_denuncia.rev_inic = rev_inic
    nueva_denuncia.observaciones = obs
    nueva_denuncia.no_inf = no_inf
    nueva_denuncia.fecha = fecha
    nueva_denuncia.codigo_caso = codigo_caso
    nueva_denuncia.tipo_resol = tipo_resol
    nueva_denuncia.h_ruta = h_ruta
    nueva_denuncia.persona_id = id_per
    nueva_denuncia.save

    #actualizamos el fallo de la persona
    actualiza_persona = Persona.find(id_per)
    actualiza_persona.fallo = fallo
    actualiza_persona.rev_inic = rev_inic
    actualiza_persona.observacion = obs
    actualiza_persona.no_inf = no_inf
    actualiza_persona.fecha = fecha
    actualiza_persona.codigo_caso = codigo_caso
    actualiza_persona.tipo_resol = tipo_resol
    actualiza_persona.h_ruta = h_ruta
    actualiza_persona.observacion = observacion
    actualiza_persona.save

    flash[:notice] = "Se guardo correctamente los datos"
    redirect_to :action => "fallo"

  end

  def imprime
    id_persona = params[:id_persona]
    #@datos_denuncia = Denuncium.where("persona_id = ?", id_persona)
    @datos_persona = Persona.where("id = ?", id_persona).last
    # byebug
    respond_to do |format|
      format.html { @datos_persona }
      format.json { render json: @datos_persona }
    end
  end

  def bs_ci_ajax
    ci_buscar = params[:ci]
    @datos_personas = Persona.where("ci like ?", "%#{ci_buscar}%")
    respond_to do |format|
      format.html { @datos_personas }
      format.json { render json: @datos_personas }
    end
    render layout: false
  end

  #fin de busqueda de fallo#

  #emision inicio de buscador#
  def emisioncertf
    #@nombre = Persona.where(tipo:"Emision")
  end

  def guarda_emision
    # agarramos los datos del array de persona
    datos_form_persona = params[:persona]
    consulta_impresos = Impreso.last
    if !consulta_impresos.blank?
      numero = consulta_impresos.numero
    else
      numero = 1
    end
    # capturamos los datos para guardar
    # ci_persona = datos_form_persona[:ci]
    id_personas = datos_form_persona[:id]
    fecha_emi_certf = datos_form_persona[:fecha_emi_certf]
    correlt_certf = datos_form_persona[:correlt_certf]
    no_reg = datos_form_persona[:no_reg]
    # byebug
    # guardamos la nueva denuncia
    nueva_impresos = Impreso.new
    nueva_impresos.fecha_emi_certf = fecha_emi_certf
    nueva_impresos.correlt_certf = correlt_certf
    nueva_impresos.no_reg = no_reg
    nueva_impresos.numero = numero.to_i + 1
    nueva_impresos.persona_id = id_personas
    nueva_impresos.save

    #actualizamos el fallo de la persona
    actualiza_persona = Persona.find_by(id: id_personas)
    actualiza_persona.fecha_emi_certf = fecha_emi_certf
    actualiza_persona.correlt_certf = correlt_certf
    actualiza_persona.no_reg = no_reg
    actualiza_persona.save

    redirect_to :action => "imprimir1", :id_persona => id_personas
    #byebug
  end

  def imprimir1
    id_persona = params[:id_persona]
    #@datos_denuncia = Denuncium.where("persona_id = ?", id_persona)
    @datos_persona = Persona.where("id = ?", id_persona).last
    # byebug
    respond_to do |format|
      format.html { @datos_persona }
      format.json { render json: @datos_persona }
    end
  end

  def bu_ci_ajax
    ci_buscar = params[:ci]
    @datos_personas = Persona.where("ci like ?", "%#{ci_buscar}%")
    respond_to do |format|
      format.html { @datos_personas }
      format.json { render json: @datos_personas }
    end
    render layout: false
  end

  def elimina_persona_grupal
    # byebug
    Egrupal.destroy(params[:id_egrupal])
  end

  #fin de busqueda de emision#

=begin
    @persona.destroys
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
=end

  def emisiongrupal

    ultimo_numero = Impreso.last

    modelo_impreso = Impreso.new
    modelo_impreso.user_id = current_user.id
    modelo_impreso.numero = ultimo_numero.numero.to_i+1
    modelo_impreso.save
    
    @id_impreso = modelo_impreso.id
    
    respond_to do |format|
      format.html
      format.json { render json: PersonaDatatable.new(view_context) }
    end
  end

  def guarda_emisiongrupal

    modelo_impreso = Impreso.find(params[:id_impreso])
    modelo_impreso.fecha_emi_certf = params[:impreso][:fecha_emi_certf]
    modelo_impreso.no_reg = params[:impreso][:no_reg]
    modelo_impreso.correlt_certf = params[:impreso][:correlt_certf]
    modelo_impreso.save

    redirect_to :action => "imprime_egrupal", :id_impreso => params[:id_impreso]
  end

  def imprime_egrupal

    # byebug
    @datos_impreso = Impreso.where("id = ?", params[:id_impreso]).first
    @personas_escogidas = Egrupal.where("impreso_id = ?", params[:id_impreso])
    # byebug
  end

  def imprimir2
    id_persona = params[:id_persona]
    #@datos_denuncia = Denuncium.where("persona_id = ?", id_persona)
    @datos_persona = Persona.where("id = ?", id_persona).last
    # byebug
    respond_to do |format|
      format.html { @datos_persona }
      format.json { render json: @datos_persona }
    end
  end

  # def bg_ci_ajax
  # ci_buscar = params[:ci]
  #@datos_personas = Persona.where("ci like ?",  "%#{ci_buscar}%")
  #respond_to do |format|
  # format.html { @datos_personas }
  #format.json { render json: @datos_personas }
  #end
  #render layout: false
  #end

  def guarda_persona_id
    id_persona_aqui = params[:id_persona]
    ult_imp_aqui = params[:ul_imp]
    # byebug
    guarda_impresos = Impreso.new
    guarda_impresos.persona_id = id_persona_aqui
    guarda_impresos.numero = ult_imp_aqui
    guarda_impresos.save
    # byebug
  end

  def mostrar_antes_imprimir
  end

  def guarda_grupal
    # byebug
    consulta_duplicados = Egrupal.where(impreso_id: params[:cod_impresion], persona_id: params[:id_persona])
    if consulta_duplicados.present?
      
    else
      guarda_en_grupo = Egrupal.new
      guarda_en_grupo.persona_id = params[:id_persona]
      guarda_en_grupo.impreso_id = params[:cod_impresion]
      guarda_en_grupo.save
    end
  end

  def muestra_grupal
    # byebug
    @consulta_grupo = Egrupal.where("impreso_id = ?", params[:cod_impresion])
    @cantidad_personas = Egrupal.where("impreso_id = ?", params[:cod_impresion]).count
    @id_impresion = params[:cod_impresion]
    render layout: false
  end

  def elimina_persona_js
    # byebug
    @consulta_grupo = Egrupal.where("seleccionados =?", params[:id_persona_aqui])
    render layout: false
  end

  def bienvenida
  end

  def muestra_usuarios
    @usuarios = User.all  
  end

  def nuevo_usuario
    # @usuario = User.new
  end

  def guarda_usuario
    # byebug
    nuevo_usuario = User.new
    if params[:contra] != ''
      nuevo_usuario.password = params[:contra]
    end
    nuevo_usuario.nombre = params[:nombre]
    nuevo_usuario.ap_paterno = params[:ap_paterno]
    nuevo_usuario.ap_materno = params[:ap_materno]
    nuevo_usuario.email = params[:email]
    nuevo_usuario.tipo_user = params[:tipo_user]
    # nuevo_usuario.encrypted_password = params[:contra]
    nuevo_usuario.save
    # guarda_en_user = user.new
    # guarda_en_user.user_id = params[:id_user]
    # guarda_en_user.username = params[:username]
    # guarda_en_user.ap_paterno = params[:ap_paterno]
    # guarda_en_user.ap_materno = params[:ap_materno]
    # guarda_en_user.tipo_user = params[:tipo_user]
    # guarda_en_user.contrasena = params[:contrasena]
    # guarda_en_user.save
    # redirect_to
    redirect_to :action => "nuevo_usuario"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_persona
    @persona = Persona.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def persona_params
    params.require(:persona).permit(:item, :ci, :nombre, :ap_paterno, :email, :contra, :ap_materno, :facultad, :carrera, :tipo, :fallo, :direccion, :telefono, :categoria, :observacion, :fecha, :borrado, :codigo_caso, :tipo_resol, :h_ruta)
  end

  def jquery
  end
end
