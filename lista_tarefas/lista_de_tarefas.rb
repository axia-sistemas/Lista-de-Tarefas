# # lista_de_tarefas.rb
# require_relative 'tarefa'

# class ListaDeTarefas
#   def initialize
#     @tarefas = []
#   end

#   def adicionar(titulo)
#     @tarefas << Tarefa.new(titulo)
#   end

#   def listar
#     puts "\n--- Tarefas ---"
#     @tarefas.each_with_index do |tarefa, i|
#       puts "#{i + 1}. #{tarefa}"
#     end
#   end

#   def marcar_como_feita(indice)
#     tarefa = @tarefas[indice]
#     if tarefa
#       tarefa.marcar_como_feita
#       puts "Tarefa marcada como feita!"
#     else
#       puts "Tarefa inválida!"
#     end
#   end
# end


# lista_de_tarefas.rb
# Importa a biblioteca padrão do Ruby pra trabalhar com JSON
require 'json'
# Carrega a classe Tarefa que a gente criou
require_relative 'tarefa'

# Essa classe representa a lista completa de tarefas
class ListaDeTarefas
  # Constante com o nome do arquivo onde vamos salvar as tarefas
  ARQUIVO = "tarefas.json"

  def initialize
    # Quando a lista é criada, já tenta carregar as tarefas salvas
    @tarefas = carregar_tarefas
  end

  # Método para adicionar uma nova tarefa à lista
  def adicionar(titulo)
    @tarefas << Tarefa.new(titulo)  # cria nova tarefa e adiciona ao array
    salvar_tarefas                  # salva tudo no arquivo
  end

  # Método para mostrar as tarefas no terminal
  def listar
    puts "\n--- Tarefas ---"
    @tarefas.each_with_index do |tarefa, i|  # percorre cada tarefa com seu índice
      puts "#{i + 1}. #{tarefa}"             # exibe número e texto da tarefa
    end
  end

  # Marca uma tarefa específica (pelo número) como feita
  def marcar_como_feita(indice)
    tarefa = @tarefas[indice]      # busca a tarefa pelo índice
    if tarefa
      tarefa.marcar_como_feita     # marca como feita
      salvar_tarefas               # salva a lista novamente
      puts "Tarefa marcada como feita!"
    else
      puts "Tarefa inválida!"
    end
  end

  private  # os métodos abaixo só podem ser usados dentro da classe

  # Salva a lista de tarefas no arquivo como JSON
  def salvar_tarefas
    dados = @tarefas.map(&:to_h)  # transforma todas as tarefas em hash
    File.write(ARQUIVO, JSON.pretty_generate(dados))  # salva no arquivo
  end

  # Carrega as tarefas do arquivo JSON, se existir
  def carregar_tarefas
    return [] unless File.exist?(ARQUIVO)  # se o arquivo não existe, retorna lista vazia

    dados = JSON.parse(File.read(ARQUIVO))             # lê e interpreta o JSON
    dados.map { |hash| Tarefa.from_h(hash) }           # transforma cada hash em Tarefa
  end
end
