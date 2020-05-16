class UpdateColumnsRecomendation < ActiveRecord::Migration[6.0]
  def change
    remove_reference :recomendations, :vendor, index: true, foreign_key: true
    remove_column :recomendations, :contact
    remove_column :recomendations, :name
  end
end
