class Tarefa < ApplicationRecord
  belongs_to :disciplina
  validates :validade, presence: true
  validates :titulo, presence: true
  def start_time
    validade
  end
end
