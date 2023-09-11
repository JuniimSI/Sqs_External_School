class CreateAlunos < ActiveRecord::Migration[6.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.date :data_nascimento
      t.references :turma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
