json.extract! aluno, :id, :nome, :data_nascimento, :turma_id, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
