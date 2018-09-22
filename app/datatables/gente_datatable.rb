class GenteDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id: { source: "Persona.id", cond: :eq,  searchable: false },
      ci: { source: "Persona.ci", cond: :like },
      nombre: { source: "Persona.nombre", cond: :like },
      fallo: { source: "Persona.fallo", cond: :like },
      observacion: { source: "Persona.observacion", cond: :like },
      carrera: { source: "Persona.carrera", cond: :like },
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
        id: record.id,
        ci: record.ci,
        nombre: record.nombre,
        fallo: record.fallo,
        observacion: record.observacion,
        carrera: record.carrera,
        acciones: dt_actions(record.id)
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    Persona.select("personas.id, personas.ci, personas.nombre, personas.fallo, personas.observacion, personas.carrera")
  end
  def dt_actions(id_persona)
    #code
    links = ('<button type="button" onclick="edita_persona('+id_persona.to_s+')" id="bt_sel" class="btn btn-success"><i class="mdi mdi-lead-pencil"></i></button>&nbsp;<button type="button" onclick="guarda_persona_js('+id_persona.to_s+')" id="bt_sel" class="btn btn-danger"><i class="mdi mdi-close"></i></button>').html_safe
  end

end
