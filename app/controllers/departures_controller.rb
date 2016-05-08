class DeparturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_departure, only: [:show, :edit, :update, :destroy]

  # GET /departures
  # GET /departures.json
  def index
    @departures = Departure.ordered
  end

  # GET /departures/1
  # GET /departures/1.json
  def show
  end

  # GET /departures/new
  def new
    @departure = Departure.new
    @stuff = Stuff.find(params[:stuff_id])
    respond_to do |format|
      format.js
    end
  end

  # GET /departures/1/edit
  def edit
  end

  # POST /departures
  # POST /departures.json
  def create
    @departure = Departure.new(departure_params)

    respond_to do |format|
      if @departure.save
        @stuffs = Stuff.ordered
        format.html { redirect_to @departure, notice: 'Saida criada com sucesso!' }
        format.json { render :show, status: :created, location: @departure }
        format.js
      else
        @stuff = Stuff.find(params["departure"]["stuff_id"])
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /departures/1
  # PATCH/PUT /departures/1.json
  def update
    respond_to do |format|
      if @departure.update(departure_params)
        format.html { redirect_to @departure, notice: 'Saida atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @departure }
      else
        format.html { render :edit }
        format.json { render json: @departure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departures/1
  # DELETE /departures/1.json
  def destroy
    @departure.destroy
    respond_to do |format|
      format.html { redirect_to departures_url, notice: 'Saida removida com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departure
      @departure = Departure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departure_params
      params.require(:departure).permit(:amount, :stuff_id)
    end
end
