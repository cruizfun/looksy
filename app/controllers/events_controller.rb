class EventsController < ApplicationController
  def index
    @events = Event.all.order({ :created_at => :desc })

    render({ :template => "events/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @event = Event.where({:id => the_id }).at(0)

    render({ :template => "events/show.html.erb" })
  end

  def create
    @event = Event.new
    @event.tag = params.fetch("tag_from_query")

    if @event.valid?
      @event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :notice => "Event failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @event = Event.where({ :id => the_id }).at(0)

    @event.tag = params.fetch("tag_from_query")

    if @event.valid?
      @event.save
      redirect_to("/events/#{@event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{@event.id}", { :alert => "Event failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @event = Event.where({ :id => the_id }).at(0)

    @event.destroy

    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end
