class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
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
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  # Builds an Event object using parameters from Eventbrite
  # eventbrite_event_id - The ID of the event in Eventbrite
  def eventbrite
    eventbrite_event_id = params[:eventbrite_event_id]
    eb_auth_tokens = {:app_key => ENV['EB_APP_KEY'], :user_key => ENV['EB_USER_KEY']}
    eb_client = EventbriteClient.new(eb_auth_tokens)
    response = eb_client.event_get( {:id => eventbrite_event_id} )

    event = Event.new
    event.name = response['event']['title']
    event.organizer_name = response['event']['organizer']['name']
    event.organizer_description = response['event']['organizer']['description']
    event.venue_name = response['event']['venue']['name']
    event.address_1 = response['event']['venue']['address']
    event.address_2 = response['event']['venue']['address_2']
    event.city = response['event']['venue']['city']
    event.region = response['event']['venue']['region']
    event.postal_code = response['event']['venue']['postal_code']
    event.country = response['event']['venue']['country']
    event.latitude = response['event']['venue']['latitude']
    event.longitude = response['event']['venue']['longitude']
    event.start = response['event']['start_date']
    event.end = response['event']['end_date']
    
    render :json => event
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start, :end)
    end
end
