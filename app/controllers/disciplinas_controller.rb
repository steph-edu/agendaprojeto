class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: %i[ show edit update destroy ]

  # GET /disciplinas or /disciplinas.json
  def index
    @disciplinas = Disciplina.all
  end

  # GET /disciplinas/1 or /disciplinas/1.json
  def show
    @disciplina = Disciplina.find(params[:id])
    @tarefas = @disciplina.tarefas
  end

  # GET /disciplinas/new
  def new
    @disciplina = Disciplina.new
  end

  # GET /disciplinas/1/edit
  def edit
  end

  # POST /disciplinas or /disciplinas.json
  def create
    @disciplina = Disciplina.new(disciplina_params)
  
    if @disciplina.save
      if params[:disciplina][:dias_semana].present?
        @disciplina.update(dias_semana: params[:disciplina][:dias_semana])
      end
  
      redirect_to @disciplina, notice: 'Disciplina criada com sucesso.'
    else
      render :new
    end
  end
  
    

  # PATCH/PUT /disciplinas/1 or /disciplinas/1.json
  def update
    respond_to do |format|
      if @disciplina.update(disciplina_params)
        format.html { redirect_to disciplina_url(@disciplina), notice: "Disciplina was successfully updated." }
        format.json { render :show, status: :ok, location: @disciplina }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1 or /disciplinas/1.json
  def destroy
    @disciplina.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Disciplina was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_disciplina
      @disciplina = Disciplina.find(params[:id])
    end

    def disciplina_params
      params.require(:disciplina).permit(:titulo, :descricao, :local, dias_semana: [])
    end    
end