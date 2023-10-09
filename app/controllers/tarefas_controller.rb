class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[ show edit update destroy ]

  # GET /tarefas or /tarefas.json
  def index
    if params[:disciplina_id]
      @disciplina = Disciplina.find(params[:disciplina_id])
      @tarefas = @disciplina.tarefas
    else
      @tarefas = Tarefa.all 
    end
  
    respond_to do |format|
      format.html 
      format.json { render json: @tarefas }
    end
  end
  
  def calendar_events
    @tarefas = Tarefa.all 
    @events = @tarefas.map { |tarefa| { title: tarefa.titulo, start: tarefa.validade } }
    render json: @events
  end
  

  # GET /tarefas/1 or /tarefas/1.json
  def show
  end

  # GET /tarefas/new
  def new
    @disciplina = Disciplina.find(params[:disciplina_id]) 
    @tarefa = Tarefa.new
  end

  # GET /tarefas/1/edit
  def edit
  end

  # POST /tarefas or /tarefas.json
  def create
    @disciplina = Disciplina.find(params[:disciplina_id])
    @tarefa = @disciplina.tarefas.build(tarefa_params)

    puts "Params: #{params.inspect}"
    puts "Tarefa: #{@tarefa}"
  
    respond_to do |format|
      if @tarefa.save
        format.html { redirect_to disciplina_path(@disciplina), notice: "Tarefa foi criada com sucesso." }
        format.json { render :show, status: :created, location: @tarefa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefas/1 or /tarefas/1.json
  def update
    respond_to do |format|
      if @tarefa.update(tarefa_params)
        format.html { redirect_to tarefa_url(@tarefa), notice: "Tarefa was successfully updated." }
        format.json { render :show, status: :ok, location: @tarefa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefas/1 or /tarefas/1.json
  def destroy
    @tarefa.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Tarefa was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def json
    @tarefas = Tarefa.all
    render json: @tarefas.map { |tarefa| { title: tarefa.title, start: tarefa.due_date } }
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end

    def tarefa_params
      params.require(:tarefa).permit(:titulo, :descricao, :validade, :disciplina_id)
    end
end
