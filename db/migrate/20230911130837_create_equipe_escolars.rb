class CreateEquipeEscolars < ActiveRecord::Migration[6.0]
  def change
    create_table :equipe_escolars do |t|
      t.string :nome
      t.string :cargo
      t.references :turma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
