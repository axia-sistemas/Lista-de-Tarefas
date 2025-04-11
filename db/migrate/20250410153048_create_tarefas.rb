class CreateTarefas < ActiveRecord::Migration[7.2]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.text :descricao
      t.boolean :concluida

      t.timestamps
    end
  end
end
