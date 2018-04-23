class AddCasaIdToBandas < ActiveRecord::Migration[5.1]
  def change
    add_column :bandas, :casa_id, :integer
  end
end
