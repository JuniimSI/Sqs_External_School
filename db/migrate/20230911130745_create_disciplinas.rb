class CreateDisciplinas < ActiveRecord::Migration[6.0]
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
