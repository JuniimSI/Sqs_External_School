class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.references :turma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
