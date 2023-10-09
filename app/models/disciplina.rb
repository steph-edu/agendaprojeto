class Disciplina < ApplicationRecord
    has_many :tarefas, dependent: :destroy
    serialize :dias_semana, Array

    validates :titulo, presence: true
    validate :pelo_menos_um_dia_semana_selecionado

    def pelo_menos_um_dia_semana_selecionado
        if dias_semana.blank?
            errors.add(:dias_semana, "Ops! Deve ser selecionado pelo menos um dia da semana")
        end
    end

end
