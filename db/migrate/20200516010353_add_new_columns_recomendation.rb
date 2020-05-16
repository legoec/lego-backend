class AddNewColumnsRecomendation < ActiveRecord::Migration[6.0]
  def change
    add_reference :recomendations, :service, null: false, foreign_key: true
    add_reference :recomendations, :user, null: false, foreign_key: true
    add_column :recomendations, :ranking, :integer, null: false, default: 0
  end
end
