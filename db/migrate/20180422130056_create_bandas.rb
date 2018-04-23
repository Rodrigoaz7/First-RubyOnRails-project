class CreateBandas < ActiveRecord::Migration[5.1]
  def change
    create_table :bandas do |t|
      t.string :nome
      t.decimal :preco
      t.string :instagram
      t.string :facebook

      t.timestamps
    end
  end
end
