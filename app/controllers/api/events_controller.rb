class Api::EventsController < ApplicationController
    def index
      @events = Event.all
      render json: @events.map { |event|
        {
          id: event.id,
          title: event.title,
          start: event.start_time,
          end: event.end_time,
          url: event_path(event),
          color: "#36D399", # You can customize this
          description: event.description
        }
      }
    end
end
