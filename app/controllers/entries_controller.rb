class EntriesController < ApplicationController
  before_action :authenticate_user!

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.ordered
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @stuff = Stuff.find(params[:stuff_id])
    respond_to do |format|
      format.js
    end
  end


  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        @stuffs = Stuff.ordered
        format.html { redirect_to entries_url, notice: 'Entrada criada com sucesso!' }
        format.json { render :show, status: :created, location: @entry }
        format.js
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:entry).permit(:amount, :stuff_id)
  end
end
