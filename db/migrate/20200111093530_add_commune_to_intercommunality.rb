class AddCommuneToIntercommunality < ActiveRecord::Migration[5.0]
  def change
    add_reference :intercommunalities, :intercommunality, foreign_key: true
  end
end
