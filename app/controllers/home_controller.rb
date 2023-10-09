class HomeController < ApplicationController
  def index
    @tarefas = Tarefa.all
    @tarefas_por_data = @tarefas.group_by { |tarefa| tarefa.validade.to_date }
    dia_atual = Date.today.strftime("%A").downcase
    @disciplinas = Disciplina.all

    @dias_semana = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
  end
end
