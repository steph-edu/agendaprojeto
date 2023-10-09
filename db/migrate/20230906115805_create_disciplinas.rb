class CreateDisciplinas < ActiveRecord::Migration[7.0]
  def change
    create_table :disciplinas do |t|
      t.string :titulo
      t.text :descricao
      t.string :local
      t.string :diasemana

      t.timestamps
    end
  end
end
