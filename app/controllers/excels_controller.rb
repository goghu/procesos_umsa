class ExcelsController < ApplicationController
  before_action :set_excel, only: [:show, :edit, :update, :destroy]

  # GET /excels
  # GET /excels.json
  def index
    @excels = Excel.all
  end

  # GET /excels/1
  # GET /excels/1.json
  def show
  end

  # GET /excels/new
  def new
    @excel = Excel.new
  end

  # GET /excels/1/edit
  def edit
  end

  # POST /excels
  # POST /excels.json
  def create
    @excel = Excel.new(excel_params)

    respond_to do |format|
      if @excel.save
        format.html {redirect_to @excel, notice: 'Excel was successfully created.'}
        format.json {render :show, status: :created, location: @excel}
      else
        format.html {render :new}
        format.json {render json: @excel.errors, status: :unprocessable_entity}
      end
    end
  end

   # PATCH/PUT /excels/1
  # PATCH/PUT /excels/1.json
  def update
    respond_to do |format|
      if @excel.update(excel_params)
        format.html {redirect_to @excel, notice: 'Excel was successfully updated.'}
        format.json {render :show, status: :ok, location: @excel}
      else
        format.html {render :edit}
        format.json {render json: @excel.errors, status: :unprocessable_entity}
      end
    end
  end

  def formexcel


=begin
    # le damos la direccion del excel para leerlo
    dir = Rails.root.join('public', 'excels', 'copia_docentesDemoPo.xlsx')
    # abrimos el excel con la gema
    workbook = RubyXL::Parser.parse(dir)

    # Accesidiendo a la hoja1 de excel se puede acceder via nombre o [0]
    sheet1=workbook[0]
    cant_filas = sheet1.sheet_data.size
    puts "\n \n \n \n"
    puts "total # of rows -- #{sheet1.sheet_data.size}"
    cant_filas.times do |cont|
      puts cont
      if (cont == 0)
        puts "Es la fila de cabeceras"
      else
        puts "Item -- #{workbook[0][cont][0].value}"
        puts "Carnet -- #{workbook[0][cont][1].value}"
        puts "Nombre -- #{workbook[0][cont][2].value}"
        puts "Facultad -- #{workbook[0][cont][3].value}"
        puts "Carrera -- #{workbook[0][cont][4].value}"
        puts "Tipo -- #{workbook[0][cont][5].value}"
        puts "Categoria -- #{workbook[0][cont][6].value}"
      end

    end
=end


  end

  def guardaexcel

    # byebug
    nombre = params[:excel][:nombre]
    archivo = params[:excel][:archivo]
    nombre_archivo = archivo.original_filename

    ver_nombre = Excel.where("nombre = ?", nombre_archivo)
    if ver_nombre.nil?
      nombre_verificado = "copia_"+nombre_archivo
    else
      nombre_verificado = nombre_archivo
    end
    File.open(Rails.root.join('public', 'excels', nombre_verificado), 'wb') do |file|
      file.write(archivo.read)
    end

    # @icon.direccion = nombre_archivo
    a = Excel.new
    a.nombre = nombre
    a.archivo = nombre_verificado
    if a.save

      # le damos la direccion del excel para leerlo
      dir = Rails.root.join('public', 'excels', nombre_verificado)
      # abrimos el excel con la gema
      workbook = RubyXL::Parser.parse(dir)

      # Accesidiendo a la hoja1 de excel se puede acceder via nombre o [0]
      sheet1=workbook[0]
      cant_filas = sheet1.sheet_data.size
      puts "\n \n \n \n"
      puts "total # of rows -- #{sheet1.sheet_data.size}"
      cant_filas.times do |cont|
        puts cont
        if (cont == 0)
          puts "Es la fila de cabeceras"
        else
          puts "Nombre -- #{workbook[0][cont][0].value}"
          puts "Ap_paterno -- #{workbook[0][cont][1].value}"
          puts "Ap_materno -- #{workbook[0][cont][2].value}"
          puts "Carnet -- #{workbook[0][cont][3].value}"
          puts "Tipo -- #{workbook[0][cont][4].value}"
          puts "Ru_Item -- #{workbook[0][cont][5].value}"
          puts "Facultad -- #{workbook[0][cont][6].value}"
          puts "Carrera -- #{workbook[0][cont][7].value}"
          puts "Categoria -- #{workbook[0][cont][8].value}"
          puts "Direccion -- #{workbook[0][cont][9].value}"
          puts "Telefono -- #{workbook[0][cont][10].value}"
          # validamos para que el carnet para que no se repitan las personas
          p = Persona.new
          p.item = workbook[0][cont][0].value
          p.ci = workbook[0][cont][1].value
          p.nombre = workbook[0][cont][2].value
          p.ap_paterno = workbook[0][cont][3].value
          p.ap_materno = workbook[0][cont][4].value
          p.facultad = workbook[0][cont][5].value
          p.carrera = workbook[0][cont][6].value
          p.tipo = workbook[0][cont][7].value
          p.categoria = workbook[0][cont][8].value
          p.direccion = workbook[0][cont][9].value
          p.telefono = workbook[0][cont][10].value
          p.save
        end

      end

    else
      puts 'no guardo'
    end

  end

  # DELETE /excels/1
  # DELETE /excels/1.json
  def destroy
    @excel.destroy
    respond_to do |format|
      format.html {redirect_to excels_url, notice: 'Excel was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_excel
    @excel = Excel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def excel_params
    params.require(:excel).permit(:nombre, :archivo)
  end

end

