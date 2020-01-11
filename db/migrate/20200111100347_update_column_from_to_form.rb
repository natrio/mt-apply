class UpdateColumnFromToForm < ActiveRecord::Migration[5.0]
  def change
    rename_column :intercommunalities, :from, :form
  end
end
