# Importamos o JSON e nossas classes
require 'json'
require_relative '../lista_de_tarefas'
require_relative '../tarefa'

# Começamos os testes para a classe ListaDeTarefas
RSpec.describe ListaDeTarefas do
  # Define um nome de arquivo só para os testes
  let(:arquivo_fake) { 'spec/tarefas_teste.json' }

  # Antes de cada teste:
  before do
    # Faz a constante ARQUIVO (que aponta pro arquivo real) apontar pro arquivo de teste
    stub_const("ListaDeTarefas::ARQUIVO", arquivo_fake)

    # Se o arquivo de teste já existia, apaga
    File.delete(arquivo_fake) if File.exist?(arquivo_fake)
  end

  # Depois de cada teste, garante que o arquivo de teste seja apagado
  after do
    File.delete(arquivo_fake) if File.exist?(arquivo_fake)
  end

  # Testa se adicionar uma tarefa funciona corretamente
  it "adiciona uma nova tarefa" do
    lista = ListaDeTarefas.new
    lista.adicionar("Aprender Ruby")

    dados = JSON.parse(File.read(arquivo_fake))  # lê o que foi salvo no arquivo
    expect(dados.first["titulo"]).to eq("Aprender Ruby")
    expect(dados.first["feito"]).to be false
  end

  # Testa se a tarefa pode ser marcada como feita e salva isso
  it "marca uma tarefa como feita" do
    lista = ListaDeTarefas.new
    lista.adicionar("Testar tarefa")
    lista.marcar_como_feita(0)

    dados = JSON.parse(File.read(arquivo_fake))
    expect(dados.first["feito"]).to be true
  end

  # Testa se o sistema carrega tarefas salvas ao iniciar
  it "carrega tarefas salvas ao iniciar" do
    # Cria um arquivo manualmente com uma tarefa
    File.write(arquivo_fake, JSON.generate([{ titulo: "Tarefa antiga", feito: true }]))

    # Cria a lista — ela vai ler do arquivo
    lista = ListaDeTarefas.new

    # Espera que o nome da tarefa apareça quando listar
    expect { lista.listar }.to output(/Tarefa antiga/).to_stdout
  end
end
