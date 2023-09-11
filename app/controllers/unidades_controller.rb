class UnidadesController < ApplicationController
  before_action :set_unidade, only: %i[ show edit update destroy ]

  # GET /unidades or /unidades.json
  def index
    @unidades = Unidade.all
  end

  # GET /unidades/1 or /unidades/1.json
  def show
  end

  # GET /unidades/new
  def new
    @unidade = Unidade.new
  end

  # GET /unidades/1/edit
  def edit
  end

  # POST /unidades or /unidades.json
  def create
    @unidade = Unidade.new(unidade_params)

    respond_to do |format|
      if @unidade.save
        # Crie um cliente do SQS
        sqs = Aws::SQS::Client.new

        # Envie uma mensagem para a fila
        queue_url = 'https://sqs.us-east-1.amazonaws.com/369869160593/QueueSQS'
        message_body = @unidade.as_json.merge({ action: 'CREATED' })
        sqs.send_message(queue_url: queue_url, message_body: message_body.to_s)

        format.html { redirect_to unidade_url(@unidade), notice: "Unidade was successfully created." }
        format.json { render :show, status: :created, location: @unidade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades/1 or /unidades/1.json
  def update
    respond_to do |format|
      if @unidade.update(unidade_params)
        format.html { redirect_to unidade_url(@unidade), notice: "Unidade was successfully updated." }
        format.json { render :show, status: :ok, location: @unidade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1 or /unidades/1.json
  def destroy
    @unidade.destroy

    respond_to do |format|
      format.html { redirect_to unidades_url, notice: "Unidade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade
      @unidade = Unidade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unidade_params
      params.require(:unidade).permit(:nome, :endereco, :telefone)
    end
end
