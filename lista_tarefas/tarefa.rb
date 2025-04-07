# tarefa.rb

# class Tarefa
#   attr_accessor :titulo, :feito

#   def initialize(titulo)
#     @titulo = titulo
#     @feito = false
#   end

#   def marcar_como_feita
#     @feito = true
#   end

#   def to_s
#     status = feito ? "[X]" : "[ ]"
#     "#{status} #{titulo}"
#   end
# end

# tarefa.rb
# Essa classe representa uma única tarefa da sua lista
class Tarefa
  # Esses dois permitem ler e escrever os valores dessas variáveis fora da classe
  attr_accessor :titulo, :feito

  # Este é o construtor. Quando você faz "Tarefa.new", é isso que roda.
  # Ele recebe o título da tarefa e, opcionalmente, se ela já está feita ou não.
  def initialize(titulo, feito = false)
    @titulo = titulo  # guarda o título (ex: "Estudar Ruby")
    @feito = feito    # guarda se ela está feita (true ou false)
  end

  # Método para marcar a tarefa como feita
  def marcar_como_feita
    @feito = true
  end

  # Esse método define como a tarefa será exibida como texto
  def to_s
    status = feito ? "[X]" : "[ ]"  # mostra [X] se estiver feita, [ ] se não
    "#{status} #{titulo}"          # exemplo: "[ ] Estudar Ruby"
  end

  # Converte a tarefa para um formato de "hash", tipo um mini dicionário
  # Isso é útil para salvar em arquivos depois
  def to_h
    { titulo: @titulo, feito: @feito }
  end

  # Esse método cria uma Tarefa a partir de um hash
  # Útil quando lemos de um arquivo JSON
  def self.from_h(hash)
    new(hash["titulo"], hash["feito"])
  end
end
