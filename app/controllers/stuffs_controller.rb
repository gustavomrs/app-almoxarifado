class StuffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stuff, only: [:show, :edit, :update, :destroy]

  # GET /stuffs
  # GET /stuffs.json
  def index
    @stuffs = Stuff.all
  end

  # GET /stuffs/1
  # GET /stuffs/1.json
  def show
  end

  # GET /stuffs/new
  def new
    @stuff = Stuff.new
  end

  # GET /stuffs/1/edit
  def edit
  end

  # POST /stuffs
  # POST /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)

    respond_to do |format|
      if @stuff.save
        format.html { redirect_to stuffs_path, notice: 'Material criado com sucesso!' }
        format.json { render :show, status: :created, location: @stuff }
      else
        format.html { render :new }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuffs/1
  # PATCH/PUT /stuffs/1.json
  def update
    respond_to do |format|
      if @stuff.update(stuff_params)
        format.html { redirect_to @stuff, notice: 'Material atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @stuff }
      else
        format.html { render :edit }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffs/1
  # DELETE /stuffs/1.json
  def destroy
    if @stuff.destroy
      respond_to do |format|
        format.html { redirect_to stuffs_url, notice: 'Material removido com sucesso' }
        format.json { head :no_content }
      end
    else
      redirect_to stuffs_path, flash: { error: @stuff.errors.full_messages }
    end
  end


  def log
    @stuff = Stuff.find(params[:stuff_id])
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stuff
    @stuff = Stuff.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stuff_params
    params.require(:stuff).permit(:name)
  end
end
