class CreateIntercommunalities < ActiveRecord::Migration[5.0]
  def change
    create_table :intercommunalities do |t|
      t.string :name
      t.integer :siren

      t.timestamps
    end
    add_index :intercommunalities, :id
  end
end
