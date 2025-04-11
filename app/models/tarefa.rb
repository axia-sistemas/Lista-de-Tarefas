class Tarefa < ApplicationRecord
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :concluida, inclusion: {in: [true, false]}


    def status
        concluida ? "Concluída" : "Pendente"
    end
end
