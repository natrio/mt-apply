class AddIntercommunalityIdToCommune < ActiveRecord::Migration[5.0]
  def change
    add_column :communes, :intercommunality_id, :interger
    add_index :communes, :intercommunality_id
  end
end
