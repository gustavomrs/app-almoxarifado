class DeparturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_departure, only: [:show, :edit, :update, :destroy]

  # GET /departures
  # GET /departures.json
  def index
    @departures = Departure.ordered
  end

  # GET /departures/new
  def new
    @departure = Departure.new
    @stuff = Stuff.find(params[:stuff_id])
    respond_to do |format|
      format.js
    end
  end

  # POST /departures
  # POST /departures.json
  def create
    @departure = Departure.new(departure_params)
    respond_to do |format|
      if @departure.save
        @stuffs = Stuff.ordered
        format.html { redirect_to @departure, notice: 'Retirada criada com sucesso!' }
        format.json { render :show, status: :created, location: @departure }
        format.js
      else
        @stuff = Stuff.find(params["departure"]["stuff_id"])
        format.js { render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def departure_params
    params.require(:departure).permit(:amount, :stuff_id)
  end
end
