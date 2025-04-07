# Esse "require_relative" importa a classe Tarefa que a gente quer testar
require_relative '../tarefa'

# Aqui começa o bloco de testes para a classe Tarefa
RSpec.describe Tarefa do

  # Esse teste verifica se a tarefa está sendo criada corretamente
  it "cria uma tarefa com título e não marcada como feita" do
    tarefa = Tarefa.new("Estudar Ruby")

    # Esperamos que o título seja o mesmo que foi passado
    expect(tarefa.titulo).to eq("Estudar Ruby")

    # Esperamos que ela ainda não esteja marcada como feita (false)
    expect(tarefa.feito).to be false
  end

  # Esse teste verifica se conseguimos marcar uma tarefa como feita
  it "marca uma tarefa como feita" do
    tarefa = Tarefa.new("Fazer exercícios")

    # Marca como feita
    tarefa.marcar_como_feita

    # Esperamos que agora esteja marcada (true)
    expect(tarefa.feito).to be true
  end

  # Esse teste verifica se a conversão para hash funciona
  it "converte para hash corretamente" do
    tarefa = Tarefa.new("Ler livro", true)

    # Esperamos um hash com os dados certos
    expect(tarefa.to_h).to eq({ titulo: "Ler livro", feito: true })
  end

  # Esse verifica se conseguimos criar uma Tarefa a partir de um hash (como o JSON faria)
  it "cria uma tarefa a partir de um hash" do
    hash = { "titulo" => "Aprender RSpec", "feito" => false }

    tarefa = Tarefa.from_h(hash)

    expect(tarefa.titulo).to eq("Aprender RSpec")
    expect(tarefa.feito).to be false
  end
end
