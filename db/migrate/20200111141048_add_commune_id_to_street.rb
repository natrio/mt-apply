class AddCommuneIdToStreet < ActiveRecord::Migration[5.0]
  def change
    add_column :streets, :commune_id, :integer
  end
end
