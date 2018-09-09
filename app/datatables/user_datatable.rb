class UserDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "User.id", cond: :eq },
      nombre: { source: "User.nombre", cond: :like },
      email: { source: "User.email", cond: :like },
      rol: { source: "User.tipo_user", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        nombre: record.nombre,
        email: record.email,
        rol: record.tipo_user
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    User.order('created_at DESC')
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
