class PersonaDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :options_for_select, :h, :productos_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Persona.id", cond: :eq,  searchable: false },
      ci: { source: "Persona.ci", cond: :like },
      nombre: { source: "Persona.nombre", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        ci: record.ci,
        nombre: record.nombre,
        acciones: dt_actions(record.id)
      }
    end
  end

  def get_raw_records
    # insert query here
    Persona.select("personas.id, personas.ci, personas.nombre")
  end

  def dt_actions(id_persona)
    # links = []
    # links = "enlace"+id_persona.to_s
    links = '<button type="button" id="bt_sel" class="btn btn-success"><i class="mdi mdi-check"></i></button>'.html_safe
    # links << h.link_to 'Edit', h.edit_user_path(object) if h.policy(object).update?
    # links << h.link_to 'Delete', h.user_path(object), method: :delete, remote: true if h.policy(object).destroy?
    # h.safe_join(links, '')
  end

end
