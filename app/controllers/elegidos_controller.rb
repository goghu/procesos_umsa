class ElegidosController < ApplicationController
  before_action :set_elegido, only: [:show, :edit, :update, :destroy]

  # GET /elegidos
  # GET /elegidos.json
  def index
    @elegidos = Elegido.all

    @elegidos_A = Elegido.where("borrado is ? and lista_id = ?", nil, 1)
    @elegidos_B = Elegido.where("borrado is ? and lista_id = ?", nil, 2)
    @elegidos_C = Elegido.where("borrado is ? and lista id = ?", nil, 3)
    #contando la cantidad de personas
    # cantidad_personas = Persona.count(:id)

    # traigo de la base todos los cargos
    cargos = Cargo.where(borrado: nil)

    # traigo todas las para acomodar a las personas
    listas = Listum.all

    # contador para recorer los docentes y los estudiantes
    conlis = 0

    while conlis < 1
      contador_doc = 0
      contador_uni = 0
      contador_ase = 0

      # personas_azar = Persona.select('id').order('rand()')
      # genero un orden aaleatorio para escoger de dodentes
      # docentes_azar = Persona.select('id, tipo').where(["tipo = ? and categoria != ?", 'Docente', 'TITULAR N']).order('rand()')
      docentes_azar = Persona.select('id, tipo').where(tipo: 'Docente').order('rand()')
      # genero un orden aaleatorio para escoger de estudiantes
      univ_azar = Persona.select('id, tipo').where(tipo: 'Universitario').order('rand()')
      asesor_azar = Persona.select('id, tipo').where(tipo: 'Asesor').order('rand()')

      # extraigo uno por uno los cargos
      cargos.each do |cargo|
        if cargo.tipo == 'Docente'
          e = Elegido.new
          e.persona_id = docentes_azar[contador_doc].id
          e.cargo_id = cargo.id
          e.fecha = Time.now.strftime("%Y-%m-%d")
          e.lista_id = listas[conlis].id
          e.save
          contador_doc += 1
        else
          if e = Elegido.new
            e.persona_id = univ_azar[contador_uni].id
            e.cargo_id = cargo.id
            e.fecha = Time.now.strftime("%Y-%m-%d")
            e.lista_id = listas[conlis].id
            e.save
            contador_uni += 1

          else
            if e = Eleido.new
              e.persona_id = asesor_azar[contador_ase].id
              e.cargo_id = cargo.id
              e.fecha = Time.now.strftime("%Y-%m-%d")
              e.lista_id = listas [conlis].id
              e.save
              contador_ase += 1
            end
          end
        end
        conlis += 1
      end

      3.times do |n|
        puts n;
      end

    end

  end

  def generar

    #contando la cantidad de personas
    # cantidad_personas = Persona.count(:id)

    # traigo de la base todos los cargos
    cargos = Cargo.where(borrado: nil)

    # traigo todas las para acomodar a las personas
    listas = Listum.all

    # personas_azar = Persona.select('id').order('rand()')
    # genero un orden aaleatorio para escoger de dodentes
    # docentes_azar = Persona.select('id, tipo').where(["tipo = ? and categoria != ?", 'Docente', 'TITULAR N']).order('rand()')
    docentes_azar = Persona.select('id, tipo').where(tipo: 'Docente').order('rand()')
    # genero un orden aaleatorio para escoger de estudiantes
    univ_azar = Persona.select('id, tipo').where(tipo: 'Estudiante').order('rand()')
    #genera un orden aleatorio para escoger un asesor
    asesor_azar = Persona.select('id, tipo').where(tipo: 'Asesor').order('rand()')

    contador_docentes = 0
    contador_universitarios = 0
    contador_asesores = 0

    7.times do |conlis|

      # extraigo uno por uno los cargos
      cargos.each do |cargo|

        if cargo.tipo == 'Docente'
          puts "Id Persona Docente -- #{docentes_azar[contador_docentes].id}"
          puts "Id Cargo -- #{cargo.id}"
          puts "La Fecha -- #{Time.now.strftime("%Y-%m-%d")}"
          puts "La lista -- #{conlis}"

          e = Elegido.new
          e.persona_id = docentes_azar[contador_docentes].id
          e.cargo_id = cargo.id
          e.fecha = Time.now.strftime("%Y-%m-%d")
          e.lista_id = listas[conlis].id
          e.save

          contador_docentes += 1
        elsif cargo.tipo == 'Estudiante'
          puts "Id Persona Estudiante -- #{univ_azar[contador_universitarios].id}"
          puts "Id Cargo -- #{cargo.id}"
          puts "La Fecha -- #{Time.now.strftime("%Y-%m-%d")}"
          puts "La lista -- #{conlis}"

          e = Elegido.new
          e.persona_id = univ_azar[contador_universitarios].id
          e.cargo_id = cargo.id
          e.fecha = Time.now.strftime("%Y-%m-%d")
          e.lista_id = listas[conlis].id
          e.save

          contador_universitarios += 1
        else
          puts "Id Persona Asesor -- #{asesor_azar[contador_asesores].id}"
          puts "Id Cargo -- #{cargo.id}"
          puts "La Fecha -- #{Time.now.strftime("%Y-%m-%d")}"
          puts "La lista -- #{conlis}"

          e = Elegido.new
          e.persona_id = asesor_azar[contador_asesores].id
          e.cargo_id = cargo.id
          e.fecha = Time.now.strftime("%Y-%m-%d")
          e.lista_id = listas[conlis].id
          e.save

          contador_asesores += 1
        end
      end
    end

    # byebug
  end

  def muestra_generado
    @lista_1 = Elegido.where(lista_id: 1)
    @lista_2 = Elegido.where(lista_id: 2)
    @lista_3 = Elegido.where(lista_id: 3)
    @lista_4 = Elegido.where(lista_id: 4)
    @lista_5 = Elegido.where(lista_id: 5)
    @lista_6 = Elegido.where(lista_id: 6)
    @lista_7 = Elegido.where(lista_id: 7)
    render :layout => false
  end

  def escoger

    @cantidad_personas = Persona.count
    @cantidad_docentes = Persona.where(tipo: 'Docente').count
    @cantidad_estudiantes = Persona.where(tipo: 'Estudiante').count
    @cantidad_asesores = Persona.where(tipo: 'Asesor').count

  end


  def leerexcel

    # le damos la direccion del excel para leerlo
    dir = Rails.root.join('public', 'excels', 'productos.xlsx')
    # abrimos el excel con la gema
    workbook = RubyXL::Parser.parse(dir)

    # recorremos todas las hojas del libro de excel
    workbook.worksheets.each do |worksheet|
      print "#{worksheet.sheet_name} |"
    end

    # Accesidiendo a la hoja1 de excel se puede acceder via nombre o [0]
    sheet1 = workbook['Sheet1']
    puts "total # of rows -- #{sheet1.sheet_data.size}"

    # obtenemos la primera fila del excel
    first_row = sheet1.sheet_data[0]
    first_row.size.times do |i|
      print "#{first_row[i].value} |"
    end

    sheet1.sheet_data.size.times do |i|
      currentRow = sheet1.sheet_data[i]
      currentRow.size.times do |j|
        print "#{currentRow[j].value} |"
      end
      puts "\n"
    end

    # byebug
  end

  # GET /elegidos/1
  # GET /elegidos/1.json
  def show
  end

  # GET /elegidos/new
  def new
    @elegido = Elegido.new
  end

  # GET /elegidos/1/edit
  def edit
  end

  # POST /elegidos
  # POST /elegidos.json
  def create
    @elegido = Elegido.new(elegido_params)

    respond_to do |format|
      if @elegido.save
        format.html {redirect_to @elegido, notice: 'Elegido was successfully created.'}
        format.json {render :show, status: :created, location: @elegido}
      else
        format.html {render :new}
        format.json {render json: @elegido.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /elegidos/1
  # PATCH/PUT /elegidos/1.json
  def update
    respond_to do |format|
      if @elegido.update(elegido_params)
        format.html {redirect_to @elegido, notice: 'Elegido was successfully updated.'}
        format.json {render :show, status: :ok, location: @elegido}
      else
        format.html {render :edit}
        format.json {render json: @elegido.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /elegidos/1
  # DELETE /elegidos/1.json
  def destroy
    @elegido.destroy
    respond_to do |format|
      format.html {redirect_to elegidos_url, notice: 'Elegido was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_elegido
    @elegido = Elegido.find(params[:id])
    #@elegido = Elegido.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def elegido_params
    params.require(:elegido).permit(:persona_id, :cargo_id, :fecha, :lista, :borrado)
  end
end
