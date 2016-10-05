class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.json { render json:@events.to_json }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if params[:type] != "remote"
      @event = Event.create(event_params)
    else
      @event = Event.create(title: params[:title], start_time: params[:start].to_time+1.day, end_time: params[:end].to_time+1.day)
    end
    redirect_to events_path
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if request.xhr?
      @event.update_attributes(start_time: params[:start],end_time: params[:end])
      respond_to do |format|
        format.json { render json:@events.to_json }
      end
    else
      @event.update(event_params)
      redirect_to events_path
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :to_do, :start, :end)
    end
end
