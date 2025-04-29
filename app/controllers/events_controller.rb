class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_event, only: [:show, :edit, :update, :destroy, :rsvp, :cancel_rsvp]
  
    def index
      @events = Event.upcoming
    end
  
    def show
    end
  
    def new
      @event = current_user.events.new
    end
  
    def create
      @event = current_user.events.new(event_params)
      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    end
  
    def calendar
      # This will render the calendar view
    end
  
    def rsvp
      @rsvp = current_user.rsvps.find_or_create_by(event_id: @event.id)
      redirect_to @event, notice: 'You have successfully RSVPed to this event.'
    end
  
    def cancel_rsvp
      @rsvp = current_user.rsvps.find_by(event_id: @event.id)
      @rsvp.destroy if @rsvp
      redirect_to @event, notice: 'Your RSVP was successfully canceled.'
    end
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    private

    def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :location)
    end
  end