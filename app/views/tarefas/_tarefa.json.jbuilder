json.extract! tarefa, :id, :titulo, :descricao, :validade, :disciplina_id, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
