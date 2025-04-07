# app.rb
# app.rb
# Aqui a gente importa a classe que gerencia tudo
require_relative 'lista_de_tarefas'

# Criamos uma nova lista
lista = ListaDeTarefas.new

# Esse loop mostra o menu e repete até a pessoa escolher sair
loop do
  puts "\n1. Adicionar tarefa"
  puts "2. Listar tarefas"
  puts "3. Marcar tarefa como concluída"
  puts "4. Sair"
  print "Escolha uma opção: "

  opcao = gets.chomp.to_i  # lê a opção digitada e transforma em número

  case opcao
  when 1
    print "Digite a tarefa: "
    titulo = gets.chomp
    lista.adicionar(titulo)
  when 2
    lista.listar
  when 3
    print "Número da tarefa: "
    indice = gets.chomp.to_i - 1
    lista.marcar_como_feita(indice)
  when 4
    puts "Saindo..."
    break
  else
    puts "Opção inválida!"
  end
end
