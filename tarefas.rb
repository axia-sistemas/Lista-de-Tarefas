# tarefas.rb

tarefas = []

loop do
  puts "\n1. Adicionar tarefa"
  puts "2. Listar tarefas"
  puts "3. Marcar tarefa como concluída"
  puts "4. Sair"
  print "Escolha uma opção: "

  opcao = gets.chomp.to_i

  case opcao
  when 1
    print "Digite a tarefa: "
    tarefa = gets.chomp
    tarefas << { titulo: tarefa, feito: false }
    puts "Tarefa adicionada!"
  when 2
    puts "\n--- Tarefas ---"
    tarefas.each_with_index do |tarefa, i|
      status = tarefa[:feito] ? "[X]" : "[ ]"
      puts "#{i + 1}. #{status} #{tarefa[:titulo]}"
    end
  when 3
    print "Número da tarefa para marcar como feita: "
    indice = gets.chomp.to_i - 1
    if tarefa = tarefas[indice]
      tarefa[:feito] = true
      puts "Tarefa marcada como feita!"
    else
      puts "Tarefa inválida!"
    end
  when 4
    puts "Saindo... Até mais!"
    break
  else
    puts "Opção inválida!"
  end

end
