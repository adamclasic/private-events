class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:notice] = "Event was created successfully"
            redirect_to @event
        else
            flash.now[:alert] = "something went wrong"
            render 'new'
        end
    end

     private 
    def event_params
        params.require(:event).permit(:title, :description, :date)
    end
end
