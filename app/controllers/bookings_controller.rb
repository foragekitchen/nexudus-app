class BookingsController < ApplicationController

  def index 
    @bookings = Booking.all
    @upcoming = @bookings.reject{|b| b.from_time.to_time < Time.now}
    @past = @bookings.reject{|b| b.from_time.to_time > Time.now}
  end

  def create 
    fromTime = Time.strptime("#{params['bookingDate']}T#{params['bookingFrom']}","%m/%d/%YT%l:%M %p").utc
    toTime = Time.strptime("#{params['bookingDate']}T#{params['bookingTo']}","%m/%d/%YT%l:%M %p").utc

    # Fix for when end-time is in the AM hours of the next day
    # TODO this scrub should really happen on the coffeescript layer before it comes in as input
    # but temporarily fixing it here because it's just easier :P
    toTime += 1.day if toTime < fromTime

    newBooking = {
      "resource_id" => params["bookingResourceId"],
      "from_time" => fromTime,
      "to_time" => toTime,
      "online" => true
    }
    booking = Booking.new(newBooking)
    response = booking.create
    if ( @response = JSON.parse(response.body) ) && @response["WasSuccessful"]
      flash[:notice] = @response["Message"] 
      redirect_to bookings_path
    else
      flash[:alert] = @response["Message"] || "There was an error saving your booking. Please try again."
      redirect_to resources_path
    end
  end
  
  def destroy
    @bookings = Space.new.bookings_by_user("")
    flash[:info] = "Ability to delete is coming soon!"
    render :index
  end

  def edit
    @bookings = Space.new.bookings_by_user("")
    flash[:info] = "Ability to edit is coming soon!"
    render :index
  end

end