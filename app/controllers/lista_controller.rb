class ListaController < ApplicationController
  before_action :set_listum, only: [:show, :edit, :update, :destroy]

  # GET /lista
  # GET /lista.json
  def index

    @lista = Listum.where(borrado: nil)
  end

  # GET /lista/1
  # GET /lista/1.json
  def show
  end

  # GET /lista/new
  def new
    @listum = Listum.new
  end

  # GET /lista/1/edit
  def edit
  end

  # POST /lista
  # POST /lista.json
  def create
    @listum = Listum.new(listum_params)

    respond_to do |format|
      if @listum.save
        format.html { redirect_to lista_url, notice: 'La Lista fue creada.' }
        format.json { render :show, status: :created, location: @listum }
      else
        format.html { render :new }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lista/1
  # PATCH/PUT /lista/1.json
  def update
    respond_to do |format|
      if @listum.update(listum_params)
        format.html { redirect_to lista_url, notice: 'La Lista fue guardada.' }
        format.json { render :show, status: :ok, location: @listum }
      else
        format.html { render :edit }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista/1
  # DELETE /lista/1.json
  def destroy

    idlist = params[:id]
    list = Listum.find(idlist)
    list.borrado = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    list.save
    respond_to do |format|
      format.html { redirect_to lista_url, notice: 'Fue eliminado correctamente' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listum
      @listum = Listum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listum_params
      params.require(:listum).permit(:nombre, :descripcion, :borrado)
    end
end
