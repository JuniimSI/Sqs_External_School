class EquipeEscolarsController < ApplicationController
  before_action :set_equipe_escolar, only: %i[ show edit update destroy ]

  # GET /equipe_escolars or /equipe_escolars.json
  def index
    @equipe_escolars = EquipeEscolar.all
  end

  # GET /equipe_escolars/1 or /equipe_escolars/1.json
  def show
  end

  # GET /equipe_escolars/new
  def new
    @equipe_escolar = EquipeEscolar.new
  end

  # GET /equipe_escolars/1/edit
  def edit
  end

  # POST /equipe_escolars or /equipe_escolars.json
  def create
    @equipe_escolar = EquipeEscolar.new(equipe_escolar_params)

    respond_to do |format|
      if @equipe_escolar.save
        ::SendSqsMessageService.new('create', 'Team', @equipe_escolar, equipe_escolar_params.to_h).call

        format.html { redirect_to equipe_escolar_url(@equipe_escolar), notice: "Equipe escolar was successfully created." }
        format.json { render :show, status: :created, location: @equipe_escolar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipe_escolar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipe_escolars/1 or /equipe_escolars/1.json
  def update
    respond_to do |format|
      if @equipe_escolar.update(equipe_escolar_params)
        ::SendSqsMessageService.new('update', 'Team', @equipe_escolar, equipe_escolar_params.to_h).call

        format.html { redirect_to equipe_escolar_url(@equipe_escolar), notice: "Equipe escolar was successfully updated." }
        format.json { render :show, status: :ok, location: @equipe_escolar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipe_escolar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipe_escolars/1 or /equipe_escolars/1.json
  def destroy
    respond_to do |format|
      if @equipe_escolar.destroy
        ::SendSqsMessageService.new('delete', 'Team', @equipe_escolar, {}).call

        format.html { redirect_to equipe_escolars_url, notice: 'equipe_escolar was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.json { render json: @equipe_escolar.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipe_escolar
      @equipe_escolar = EquipeEscolar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipe_escolar_params
      params.require(:equipe_escolar).permit(:nome, :cargo, :turma_id)
    end
end
