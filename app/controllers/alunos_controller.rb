class AlunosController < ApplicationController
  before_action :set_aluno, only: %i[ show edit update destroy ]

  # GET /alunos or /alunos.json
  def index
    @alunos = Aluno.all
  end

  # GET /alunos/1 or /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
  end

  # POST /alunos or /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        ::SendSqsMessageService.new('create', 'Student', @aluno, aluno_params.to_h).call

        format.html { redirect_to aluno_url(@aluno), notice: "Aluno was successfully created." }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1 or /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        ::SendSqsMessageService.new('update', 'Student', @aluno, aluno_params.to_h).call

        format.html { redirect_to aluno_url(@aluno), notice: "Aluno was successfully updated." }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1 or /alunos/1.json
  def destroy
    respond_to do |format|
      if @aluno.destroy
        ::SendSqsMessageService.new('delete', 'Student', @aluno, {}).call

        format.html { redirect_to alunos_url, notice: 'aluno was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_aluno
    @aluno = Aluno.find(params[:id])
  end

  def aluno_params
    params.require(:aluno).permit(:nome, :turma_id)
  end
end
