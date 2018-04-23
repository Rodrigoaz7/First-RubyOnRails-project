class CasasController < ApplicationController
  before_action :set_casa, only: [:show, :edit, :update, :destroy]

  # GET /casas
  def index
    @casas = Casa.all
  end

  # GET /casas/1
  def show
  end

  # GET /casas/new
  def new
    @casa = Casa.new
  end

  # GET /casas/1/edit
  def edit
  end

  # POST /casas
  def create
    valores = params.require(:casa).permit :nome, :tipo, :endereco
    @casa = Casa.new valores
    if @casa.save
      flash[:notice] = "Criado com sucesso!"
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /casas/1
  def update
    if @casa.update(casa_params)
      redirect_to @casa, notice: 'Casa was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /casas/1
  def destroy
    @casa.destroy
    redirect_to casas_url, notice: 'Casa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casa
      @casa = Casa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def casa_params
      params.require(:casa).permit(:nome, :tipo, :endereco)
    end
end
