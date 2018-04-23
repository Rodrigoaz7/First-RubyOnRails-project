class CreateCasas < ActiveRecord::Migration[5.1]
  def change
    create_table :casas do |t|
      t.string :nome
      t.string :tipo
      t.string :endereco

      t.timestamps
    end
  end
end
