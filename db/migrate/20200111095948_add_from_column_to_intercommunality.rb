class AddFromColumnToIntercommunality < ActiveRecord::Migration[5.0]
  def change
    add_column :intercommunalities, :from, :string
  end
end
