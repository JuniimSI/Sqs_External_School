class ResponsavelsController < ApplicationController
  before_action :set_responsavel, only: %i[ show edit update destroy ]

  # GET /responsavels or /responsavels.json
  def index
    @responsavels = Responsavel.all
  end

  # GET /responsavels/1 or /responsavels/1.json
  def show
  end

  # GET /responsavels/new
  def new
    @responsavel = Responsavel.new
  end

  # GET /responsavels/1/edit
  def edit
  end

  # POST /responsavels or /responsavels.json
  def create
    @responsavel = Responsavel.new(responsavel_params)

    respond_to do |format|
      if @responsavel.save
        ::SendSqsMessageService.new('create', 'Responsible', @responsavel, responsavel_params.to_h).call

        format.html { redirect_to responsavel_url(@responsavel), notice: "Responsavel was successfully created." }
        format.json { render :show, status: :created, location: @responsavel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @responsavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsavels/1 or /responsavels/1.json
  def update
    respond_to do |format|
      if @responsavel.update(responsavel_params)
        ::SendSqsMessageService.new('update', 'Responsible', @responsavel, responsavel_params.to_h).call

        format.html { redirect_to responsavel_url(@responsavel), notice: "Responsavel was successfully updated." }
        format.json { render :show, status: :ok, location: @responsavel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @responsavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsavels/1 or /responsavels/1.json
  def destroy
    respond_to do |format|
      if @responsavel.destroy
        ::SendSqsMessageService.new('delete', 'Responsible', @responsavel, {}).call

        format.html { redirect_to responsavels_url, notice: 'responsavel was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.json { render json: @responsavel.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_responsavel
    @responsavel = Responsavel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def responsavel_params
    params.require(:responsavel).permit(:nome, :email, :telefone, :aluno_id)
  end
end
