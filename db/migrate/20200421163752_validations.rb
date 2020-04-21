class Validations < ActiveRecord::Migration[6.0]
  def change
    change_column_null :vendors, :ruc, false
    change_column_null :vendors, :mobile, false
    change_column_null :vendors, :business_name, false
    change_column_null :vendors, :legal_representative, false
    change_column_null :services, :name, false
    change_column_null :services, :price, false
    change_column_null :recomendations, :name, false
    change_column_null :recomendations, :contact, false
    change_column_null :experiences, :name, false
    change_column_null :experiences, :start_date, false
    change_column_null :experiences, :end_date, false
    change_column_null :agreements, :name, false
    change_column_null :agreements, :duration, false
    change_column_null :agreements, :cost, false
    change_column_null :agreements, :rating, false
  end
end
