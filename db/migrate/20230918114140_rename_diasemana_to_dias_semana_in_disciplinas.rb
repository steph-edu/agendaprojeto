class RenameDiasemanaToDiasSemanaInDisciplinas < ActiveRecord::Migration[7.0]
  def change
    rename_column :disciplinas, :diasemana, :dias_semana
  end
end
