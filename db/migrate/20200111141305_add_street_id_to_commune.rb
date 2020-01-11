class AddStreetIdToCommune < ActiveRecord::Migration[5.0]
  def change
    add_column :communes, :street_id, :integer
  end
end
