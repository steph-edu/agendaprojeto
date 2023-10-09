class CreateTarefas < ActiveRecord::Migration[7.0]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.text :descricao
      t.date :validade
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
