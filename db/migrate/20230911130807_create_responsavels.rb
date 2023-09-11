class CreateResponsavels < ActiveRecord::Migration[6.0]
  def change
    create_table :responsavels do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.references :aluno, null: false, foreign_key: true

      t.timestamps
    end
  end
end
